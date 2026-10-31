import SwiftUI
import MapKit

struct ImpactView: View {
    enum Pane: String, CaseIterable { case agencies = "Agencies", contributions = "Contributions" }

    @State private var selected: Institution?
    @State private var pane: Pane = .agencies

    private let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    var body: some View {
        NavigationStack {
            ZStack {
                AmbientBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Picker("Section", selection: $pane) {
                            ForEach(Pane.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                        }
                        .pickerStyle(.segmented)
                        .onChange(of: pane) { _ in Haptics.tap() }

                        if pane == .agencies {
                            agencies
                        } else {
                            ContributionsView()
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Impact")
            .sheet(item: $selected) { InstitutionDetail(institution: $0) }
        }
    }

    @ViewBuilder
    private var agencies: some View {
        Text("The Imamat's development, health, education and cultural work, serving people of all faiths. Tap an agency to see where it works, who it helps and what it has done.")
            .font(.subheadline)
            .foregroundStyle(.secondary)

        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(Array(ImpactData.metrics.enumerated()), id: \.element.id) { index, metric in
                MetricTile(metric: metric, delay: Double(index) * 0.12)
            }
        }

        Text("Agencies")
            .font(.title3.bold())
            .foregroundStyle(Color.emerald)

        ForEach(ImpactData.institutions) { institution in
            Button {
                Haptics.tap()
                selected = institution
            } label: {
                InstitutionRow(institution: institution)
            }
            .buttonStyle(SpringButtonStyle())
        }

        Text("Figures from AKDN, Aga Khan University and University of Central Asia public pages; they change over time.")
            .font(.caption2)
            .foregroundStyle(.secondary)
    }
}

// MARK: - Animated metric tile

struct MetricTile: View {
    let metric: ImpactMetric
    let delay: Double
    @State private var shown: Double = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: metric.symbol)
                .font(.title3)
                .foregroundStyle(Color.gold)
            CountingText(value: shown, target: metric.value, prefix: metric.prefix, suffix: metric.suffix)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundStyle(Color.emerald)
            Text(metric.label)
                .font(.footnote.weight(.semibold))
            Text(metric.source)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .card(cornerRadius: 18)
        .onAppear {
            guard shown == 0 else { return }
            withAnimation(.spring(response: 1.4, dampingFraction: 0.9).delay(delay)) {
                shown = metric.value
            }
        }
    }
}

/// Text that animates its number as `value` changes.
struct CountingText: View, Animatable {
    var value: Double
    let target: Double
    let prefix: String
    let suffix: String

    var animatableData: Double {
        get { value }
        set { value = newValue }
    }

    var body: some View {
        Text(prefix + formatted + suffix)
            .monospacedDigit()
    }

    private var formatted: String {
        // Keep one decimal place for small values like 2.2, none for whole numbers.
        if target.rounded() != target { return String(format: "%.1f", value) }
        return NumberFormatter.localizedString(from: NSNumber(value: Int(value.rounded())), number: .decimal)
    }
}

// MARK: - Institutions

struct InstitutionRow: View {
    let institution: Institution

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: institution.symbol)
                .font(.title3)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            VStack(alignment: .leading, spacing: 2) {
                Text(institution.acronym)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(institution.focus)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right").foregroundStyle(.secondary)
        }
        .card()
    }
}

struct InstitutionDetail: View {
    let institution: Institution
    @Environment(\.dismiss) private var dismiss

    private let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Image(systemName: institution.symbol)
                        .font(.system(size: 40))
                        .foregroundStyle(Color.gold)
                    Text(institution.name)
                        .font(.title.bold())
                    PillTag(text: institution.focus)
                    Text(institution.description)
                        .fixedSize(horizontal: false, vertical: true)

                    if !institution.founded.isEmpty {
                        InfoRow(symbol: "calendar", title: "Founded", text: institution.founded)
                    }

                    if !institution.figures.isEmpty {
                        sectionTitle("By the numbers", symbol: "number")
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(institution.figures) { figure in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(figure.value)
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                        .foregroundStyle(Color.emerald)
                                    Text(figure.label)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .frame(maxWidth: .infinity, minHeight: 70, alignment: .topLeading)
                                .card(cornerRadius: 14)
                            }
                        }
                    }

                    if !institution.whereItWorks.isEmpty || !institution.places.isEmpty {
                        sectionTitle("Where it works", symbol: "map.fill")
                        if !institution.whereItWorks.isEmpty {
                            Text(institution.whereItWorks)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        if !institution.places.isEmpty {
                            PlacesMap(places: institution.places)
                                .frame(height: 220)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            Text(institution.places.map(\.name).joined(separator: " · "))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }

                    if !institution.whoItHelps.isEmpty {
                        sectionTitle("Who it helps", symbol: "person.3.fill")
                        Text(institution.whoItHelps)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    if !institution.responses.isEmpty {
                        sectionTitle("Where it has helped", symbol: "hands.sparkles.fill")
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(institution.responses, id: \.self) { item in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "checkmark.circle.fill").foregroundStyle(Color.emerald)
                                    Text(item).fixedSize(horizontal: false, vertical: true)
                                }
                                .font(.subheadline)
                            }
                        }
                        .card()
                    }

                    sectionTitle("Highlights", symbol: "star.fill")
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(institution.highlights, id: \.self) { item in
                            Label(item, systemImage: "sparkle")
                                .font(.subheadline)
                        }
                    }
                    .card()

                    if !institution.source.isEmpty {
                        Text("Source: \(institution.source)")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding()
            }
            .navigationTitle(institution.acronym)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) { Button("Done") { dismiss() } }
            }
        }
        .presentationDetents([.large])
    }

    private func sectionTitle(_ title: String, symbol: String) -> some View {
        Label(title, systemImage: symbol)
            .font(.headline)
            .foregroundStyle(Color.emerald)
            .padding(.top, 4)
    }
}

/// Simple pin map that fits all the given places (iOS 16 Map API).
struct PlacesMap: View {
    let places: [MapPlace]
    @State private var region: MKCoordinateRegion

    init(places: [MapPlace]) {
        self.places = places
        let lats = places.map(\.latitude), lons = places.map(\.longitude)
        let minLat = lats.min() ?? 0, maxLat = lats.max() ?? 0
        let minLon = lons.min() ?? 0, maxLon = lons.max() ?? 0
        let center = CLLocationCoordinate2D(latitude: (minLat + maxLat) / 2, longitude: (minLon + maxLon) / 2)
        let span = MKCoordinateSpan(latitudeDelta: min(max((maxLat - minLat) * 1.6, 12), 150),
                                    longitudeDelta: min(max((maxLon - minLon) * 1.4, 12), 300))
        _region = State(initialValue: MKCoordinateRegion(center: center, span: span))
    }

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: places) { place in
            MapMarker(coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude),
                      tint: .green)
        }
    }
}
