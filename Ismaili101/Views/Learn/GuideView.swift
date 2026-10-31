import SwiftUI

/// Renders a GuidePage: festivals, everyday ethics, institutions.
struct GuideView: View {
    let page: GuidePage
    @EnvironmentObject private var progress: ProgressStore

    var body: some View {
        ZStack {
            AmbientBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Image(systemName: page.symbol)
                            .font(.system(size: 32))
                            .foregroundStyle(Color.gold)
                        Text(page.title)
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                        Text(page.subtitle)
                            .foregroundStyle(.white.opacity(0.85))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(22)
                    .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 26, style: .continuous))

                    Text(page.intro)
                        .fixedSize(horizontal: false, vertical: true)
                        .card()

                    ForEach(page.sections) { section in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(alignment: .firstTextBaseline) {
                                Label(section.heading, systemImage: section.symbol)
                                    .font(.headline)
                                    .foregroundStyle(Color.emerald)
                                Spacer()
                                if let detail = section.detail {
                                    Text(detail)
                                        .font(.caption.weight(.bold))
                                        .foregroundStyle(Color.gold)
                                        .multilineTextAlignment(.trailing)
                                }
                            }
                            ForEach(section.body, id: \.self) { paragraph in
                                Text(paragraph)
                                    .font(.subheadline)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineSpacing(2)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .card()
                    }

                    if let note = page.note {
                        Label(note, systemImage: "info.circle")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    SourcesList(sources: page.sources)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { progress.recordActivity() }
    }
}
