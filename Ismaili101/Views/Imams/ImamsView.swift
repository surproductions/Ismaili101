import SwiftUI

struct ImamsView: View {
    enum Pane: String, CaseIterable { case imams = "Imams", journey = "Journey" }

    @StateObject private var vm = ImamsViewModel()
    @State private var section: Pane = .imams

    var body: some View {
        NavigationStack {
            ZStack {
                AmbientBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        Picker("Section", selection: $section) {
                            ForEach(Pane.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        .padding(.bottom, 14)
                        .onChange(of: section) { _ in Haptics.tap() }

                        if section == .imams {
                            eraFilter
                                .padding(.bottom, 12)
                            Text("A selection of key Imams from the line of 50.")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                                .padding(.horizontal)
                                .padding(.bottom, 8)
                            LazyVStack(spacing: 0) {
                                ForEach(Array(vm.filtered.enumerated()), id: \.element.id) { index, imam in
                                    TimelineRow(imam: imam, isLast: index == vm.filtered.count - 1)
                                        .transition(.asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity),
                                                                removal: .opacity))
                                }
                            }
                            .padding(.horizontal)
                        } else {
                            JourneyView()
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("History")
        }
    }

    private var eraFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(ImamEra.allCases) { era in
                    let selected = vm.selectedEra == era
                    Button { vm.select(era) } label: {
                        Label(era.rawValue, systemImage: era.symbol)
                            .font(.subheadline.weight(.semibold))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(
                                Capsule().fill(selected ? AnyShapeStyle(LinearGradient.brand)
                                                        : AnyShapeStyle(.ultraThinMaterial))
                            )
                            .foregroundStyle(selected ? Color.white : Color.primary)
                    }
                    .buttonStyle(SpringButtonStyle())
                }
            }
            .padding(.horizontal)
        }
    }
}

struct TimelineRow: View {
    let imam: Imam
    let isLast: Bool

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Text("\(imam.number)")
                .font(.subheadline.bold().monospacedDigit())
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .background(
                    Circle().fill(imam.isPresentImam ? AnyShapeStyle(LinearGradient.goldShine)
                                                     : AnyShapeStyle(LinearGradient.brand))
                )
            ImamCard(imam: imam)
                .padding(.bottom, 16)
        }
        // Timeline rail: drawn as a background so it stretches to the row's full height.
        .background(alignment: .topLeading) {
            if !isLast {
                Rectangle()
                    .fill(Color.emerald.opacity(0.3))
                    .frame(width: 2)
                    .padding(.top, 40)
                    .padding(.leading, 19)
            }
        }
    }
}

struct ImamCard: View {
    let imam: Imam
    @State private var expanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                PillTag(text: imam.era.rawValue)
                if imam.isPresentImam { PillTag(text: "Present Imam", color: .gold) }
                Spacer()
            }
            Text(imam.name)
                .font(.headline)
            Label(imam.period, systemImage: "calendar")
                .font(.caption.weight(.semibold))
                .foregroundStyle(Color.emerald)
            Text(imam.summary)
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)

            Button {
                Haptics.tap()
                withAnimation(.spring()) { expanded.toggle() }
            } label: {
                Label(expanded ? "Show less" : "Cool fact & history",
                      systemImage: expanded ? "chevron.up" : "sparkles")
                    .font(.subheadline.bold())
                    .foregroundStyle(Color.gold)
            }
            .buttonStyle(SpringButtonStyle())

            if expanded {
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "star.fill").foregroundStyle(Color.gold)
                    Text(imam.coolFact)
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gold.opacity(0.12), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).strokeBorder(Color.gold.opacity(0.4)))
                .transition(.scale(scale: 0.95, anchor: .top).combined(with: .opacity))

                VStack(alignment: .leading, spacing: 10) {
                    InfoRow(symbol: "building.columns.fill", title: "Empire / state", text: imam.realm)
                    InfoRow(symbol: "mappin.and.ellipse", title: "Lived in", text: imam.residence)
                }
                .transition(.opacity)

                VStack(alignment: .leading, spacing: 8) {
                    Label("Meanwhile in the world", systemImage: "globe.europe.africa.fill")
                        .font(.subheadline.bold())
                        .foregroundStyle(Color.emerald)
                    ForEach(imam.meanwhile, id: \.self) { event in
                        HStack(alignment: .top, spacing: 8) {
                            Circle().fill(Color.emerald.opacity(0.6)).frame(width: 6, height: 6).padding(.top, 6)
                            Text(event)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.emerald.opacity(0.08), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                .transition(.opacity)

                if !imam.contemporaries.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Famous contemporaries", systemImage: "person.2.fill")
                            .font(.subheadline.bold())
                            .foregroundStyle(Color.gold)
                        ForEach(imam.contemporaries, id: \.self) { person in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "person.fill")
                                    .font(.caption)
                                    .foregroundStyle(Color.gold)
                                    .padding(.top, 3)
                                Text(person)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gold.opacity(0.10), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .transition(.opacity)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .card()
    }
}

struct InfoRow: View {
    let symbol: String
    let title: String
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: symbol)
                .foregroundStyle(Color.emerald)
                .frame(width: 22)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
                Text(text)
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}
