import SwiftUI

/// Collapsible list of tappable sources, shown at the end of a chapter or section.
struct SourcesList: View {
    let sources: [SourceLink]
    @State private var open = false

    var body: some View {
        if !sources.isEmpty {
            VStack(alignment: .leading, spacing: 10) {
                Button {
                    Haptics.tap()
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) { open.toggle() }
                } label: {
                    HStack {
                        Label("Sources (\(sources.count))", systemImage: "text.book.closed")
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(Color.emerald)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .font(.caption.weight(.bold))
                            .foregroundStyle(Color.emerald)
                            .rotationEffect(.degrees(open ? 180 : 0))
                    }
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .accessibilityHint(open ? "Hide sources" : "Show sources")

                if open {
                    ForEach(sources) { source in
                        if let url = URL(string: source.url) {
                            Link(destination: url) {
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "arrow.up.right.square")
                                        .font(.caption)
                                        .padding(.top, 2)
                                    Text(source.title)
                                        .font(.footnote)
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .transition(.opacity)
                }
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(UIColor.secondarySystemFill).opacity(0.6),
                        in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
    }
}

/// A large tappable card used to link to sections.
struct LinkCard: View {
    let title: String
    let subtitle: String
    let symbol: String
    var gold = false

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: symbol)
                .font(.title3)
                .foregroundStyle(gold ? Color.emeraldDeep : .white)
                .frame(width: 48, height: 48)
                .background(gold ? AnyShapeStyle(LinearGradient.goldShine) : AnyShapeStyle(LinearGradient.brand),
                            in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            Spacer(minLength: 4)
            Image(systemName: "chevron.right")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.tertiary)
        }
        .card()
    }
}

/// Section heading used on long scrolling screens.
struct SectionHeader: View {
    let title: String
    var symbol: String? = nil

    var body: some View {
        HStack(spacing: 8) {
            if let symbol {
                Image(systemName: symbol)
            }
            Text(title)
        }
        .font(.title3.bold())
        .foregroundStyle(Color.emerald)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 6)
        .accessibilityAddTraits(.isHeader)
    }
}
