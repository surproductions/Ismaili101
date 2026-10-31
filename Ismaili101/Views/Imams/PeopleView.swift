import SwiftUI

/// Da'is, pirs and women in Ismaili history.
struct PeopleView: View {
    @State private var group: FigureGroup = .dais

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("The teachers, poets and leaders — women and men — who carried the faith across centuries.")
                .font(.footnote)
                .foregroundStyle(.secondary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(FigureGroup.allCases, id: \.self) { item in
                        let selected = group == item
                        Button {
                            Haptics.tap()
                            withAnimation(.spring()) { group = item }
                        } label: {
                            Label(item.rawValue, systemImage: item.symbol)
                                .font(.subheadline.weight(.semibold))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 7)
                                .background(Capsule().fill(selected ? AnyShapeStyle(LinearGradient.brand) : AnyShapeStyle(.ultraThinMaterial)))
                                .foregroundStyle(selected ? Color.white : Color.primary)
                        }
                        .buttonStyle(SpringButtonStyle())
                    }
                }
            }

            ForEach(PeopleData.all.filter { $0.group == group }) { FigureCard(figure: $0) }

            SourcesList(sources: Sources.people)
        }
        .padding(.horizontal)
    }
}

struct FigureCard: View {
    let figure: HistoricalFigure

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline) {
                Text(figure.name)
                    .font(.headline)
                Spacer()
                Text(figure.dates)
                    .font(.caption.weight(.bold).monospacedDigit())
                    .foregroundStyle(Color.gold)
                    .multilineTextAlignment(.trailing)
            }
            Text(figure.role)
                .font(.caption.weight(.semibold))
                .foregroundStyle(Color.emerald)
            Text(figure.text)
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
            if let legacy = figure.legacy {
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "star.fill").foregroundStyle(Color.gold).font(.caption).padding(.top, 2)
                    Text(legacy)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .card()
    }
}

/// Simple list of all 50 Imams.
struct AllImamsView: View {
    var body: some View {
        ZStack {
            AmbientBackground()
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 8) {
                    Text("The full line of Imams in the Nizari Ismaili count, from Hazrat Ali to Mawlana Hazar Imam. Dates in periods of concealment are approximate.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 6)
                    ForEach(AllImamsData.all) { entry in
                        HStack(alignment: .top, spacing: 12) {
                            Text("\(entry.number)")
                                .font(.subheadline.bold().monospacedDigit())
                                .foregroundStyle(entry.number == 50 ? Color.emeraldDeep : .white)
                                .frame(width: 36, height: 36)
                                .background(Circle().fill(entry.number == 50 ? AnyShapeStyle(LinearGradient.goldShine)
                                                                             : AnyShapeStyle(LinearGradient.brand)))
                            VStack(alignment: .leading, spacing: 2) {
                                Text(entry.name)
                                    .font(.subheadline.weight(.semibold))
                                Text(entry.dates)
                                    .font(.caption.monospacedDigit())
                                    .foregroundStyle(.secondary)
                                if let note = entry.note {
                                    Text(note)
                                        .font(.caption)
                                        .foregroundStyle(Color.emerald)
                                }
                            }
                            Spacer(minLength: 0)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .accessibilityElement(children: .combine)
                    }
                    SourcesList(sources: [Src.handwikiImams, Src.amaanaHistory, Src.iisNizari, Src.wikiMustansirII])
                        .padding(.top, 8)
                }
                .padding()
            }
        }
        .navigationTitle("All 50 Imams")
        .navigationBarTitleDisplayMode(.inline)
    }
}
