import SwiftUI

struct ImpactView: View {
    @State private var selected: Institution?

    private let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    var body: some View {
        NavigationStack {
            ZStack {
                AmbientBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("The Imamat's development, health, education and cultural work, serving people of all faiths.")
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

                        Text("Figures from AKDN and Aga Khan University public pages.")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                }
            }
            .navigationTitle("Impact")
            .sheet(item: $selected) { InstitutionDetail(institution: $0) }
        }
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
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(institution.highlights, id: \.self) { item in
                            Label(item, systemImage: "checkmark.circle.fill")
                                .symbolRenderingMode(.hierarchical)
                                .foregroundStyle(Color.emerald)
                        }
                    }
                    .card()
                }
                .padding()
            }
            .navigationTitle(institution.acronym)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) { Button("Done") { dismiss() } }
            }
        }
        .presentationDetents([.medium, .large])
    }
}
