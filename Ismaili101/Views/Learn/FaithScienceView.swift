import SwiftUI

/// Entry card on the Learn tab.
struct FaithScienceCard: View {
    var body: some View {
        NavigationLink(value: LearnRoute.faithScience) {
            LinkCard(title: "Faith & Science",
                     subtitle: "Muslim discoveries, the 'miracles' debate, and how it all fits",
                     symbol: "atom")
        }
        .buttonStyle(SpringButtonStyle())
    }
}

struct FaithScienceView: View {
    enum Part: String, CaseIterable { case discoveries = "Discoveries", inspired = "Inspired", debate = "Debate", fits = "Fits" }

    @State private var part: Part = .discoveries
    @State private var field: ScienceField?

    private var discoveries: [Discovery] {
        guard let field else { return FaithScienceData.discoveries }
        return FaithScienceData.discoveries.filter { $0.field == field }
    }

    var body: some View {
        ZStack {
            AmbientBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Picker("Part", selection: $part) {
                        ForEach(Part.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: part) { _ in Haptics.tap() }

                    switch part {
                    case .discoveries: discoveriesPart
                    case .inspired: inspiredPart
                    case .debate: debatePart
                    case .fits: fitsPart
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Faith & Science")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: Discoveries

    @ViewBuilder
    private var discoveriesPart: some View {
        Text("Real discoveries and inventions by scientists in Muslim societies — many centuries before similar work in Europe.")
            .font(.subheadline)
            .foregroundStyle(.secondary)

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                fieldChip(nil, label: "All", symbol: "square.grid.2x2.fill")
                ForEach(ScienceField.allCases) { fieldChip($0, label: $0.rawValue, symbol: $0.symbol) }
            }
        }

        ForEach(discoveries) { DiscoveryCard(discovery: $0) }
        SourcesList(sources: Sources.faithScience)
    }

    private func fieldChip(_ value: ScienceField?, label: String, symbol: String) -> some View {
        let selected = field == value
        return Button {
            Haptics.tap()
            withAnimation(.spring()) { field = value }
        } label: {
            Label(label, systemImage: symbol)
                .font(.subheadline.weight(.semibold))
                .padding(.horizontal, 12)
                .padding(.vertical, 7)
                .background(Capsule().fill(selected ? AnyShapeStyle(LinearGradient.brand) : AnyShapeStyle(.ultraThinMaterial)))
                .foregroundStyle(selected ? Color.white : Color.primary)
        }
        .buttonStyle(SpringButtonStyle())
    }

    // MARK: Inspired

    @ViewBuilder
    private var inspiredPart: some View {
        Text("Verses that encouraged Muslims to read, observe and reflect — inspiration for inquiry, not predictions of science.")
            .font(.subheadline)
            .foregroundStyle(.secondary)

        ForEach(FaithScienceData.verses) { verse in
            VStack(alignment: .leading, spacing: 8) {
                Text(verse.reference)
                    .font(.caption.weight(.bold))
                    .foregroundStyle(Color.emerald)
                Text("“\(verse.text)”")
                    .font(.body.italic())
                    .fixedSize(horizontal: false, vertical: true)
                Text(verse.note)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .card()
        }
    }

    // MARK: Debate

    @ViewBuilder
    private var debatePart: some View {
        Text("Some people say the Qur'an predicted modern discoveries. Here is what supporters and critics say — so you can judge for yourself.")
            .font(.subheadline)
            .foregroundStyle(.secondary)

        ForEach(FaithScienceData.debated) { DebateCard(claim: $0) }

        VStack(alignment: .leading, spacing: 10) {
            Label("The honest takeaway", systemImage: "scalemass.fill")
                .font(.headline)
                .foregroundStyle(Color.gold)
            ForEach(FaithScienceData.debateTakeaway, id: \.self) { paragraph in
                Text(paragraph)
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gold.opacity(0.12), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        SourcesList(sources: [Src.quran("21:30", "21/30"), Src.quran("51:47", "51/47"),
                              Src.quran("23:12–14", "23/12-14"), Src.quran("55:19–20", "55/19-20")])
    }

    // MARK: Fits

    @ViewBuilder
    private var fitsPart: some View {
        Text("How Ismaili thought sits alongside modern science — and the questions science alone can't answer.")
            .font(.subheadline)
            .foregroundStyle(.secondary)

        ForEach(Array(FaithScienceData.fitsWith.enumerated()), id: \.element.id) { index, lesson in
            LessonCard(lesson: lesson, number: index + 1)
        }
        SourcesList(sources: Sources.faithScience)
    }
}

struct DiscoveryCard: View {
    let discovery: Discovery

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                PillTag(text: discovery.field.rawValue)
                Spacer()
                Text(discovery.when)
                    .font(.caption.weight(.bold).monospacedDigit())
                    .foregroundStyle(Color.gold)
            }
            Text(discovery.title)
                .font(.headline)
            Label("\(discovery.person) · \(discovery.place)", systemImage: "person.fill")
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
            Text(discovery.text)
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
            if let impact = discovery.lastingImpact {
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "arrow.forward.circle.fill").foregroundStyle(Color.emerald)
                    Text(impact)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            if let link = discovery.ismailiLink {
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "star.fill").foregroundStyle(Color.gold)
                    Text(link)
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gold.opacity(0.12), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .card()
    }
}

struct DebateCard: View {
    let claim: DebatedClaim
    @State private var open = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button {
                Haptics.tap()
                withAnimation(.spring(response: 0.4, dampingFraction: 0.85)) { open.toggle() }
            } label: {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(claim.reference)
                            .font(.caption.weight(.bold))
                            .foregroundStyle(Color.emerald)
                        Text(claim.topic)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Text("“\(claim.verse)”")
                            .font(.subheadline.italic())
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundStyle(Color.emerald)
                        .rotationEffect(.degrees(open ? 180 : 0))
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)

            if open {
                side("Supporters say", text: claim.supporters, symbol: "hand.thumbsup.fill", color: .emerald)
                side("Critics say", text: claim.critics, symbol: "questionmark.circle.fill", color: .orange)
            }
        }
        .card()
    }

    private func side(_ title: String, text: String, symbol: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.caption.weight(.bold))
                .foregroundStyle(color)
            Text(text)
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color.opacity(0.08), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        .transition(.opacity.combined(with: .move(edge: .top)))
    }
}
