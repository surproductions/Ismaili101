import SwiftUI

struct LearnView: View {
    @StateObject private var vm = LearnViewModel()
    @EnvironmentObject private var progress: ProgressStore

    var body: some View {
        NavigationStack {
            ZStack {
                AmbientBackground()
                ScrollView {
                    VStack(spacing: 16) {
                        progressHeader
                        ForEach(vm.chapters) { chapter in
                            NavigationLink(value: chapter) {
                                ChapterRow(chapter: chapter, isDone: progress.isCompleted(chapter))
                            }
                            .buttonStyle(SpringButtonStyle())
                            .simultaneousGesture(TapGesture().onEnded { Haptics.tap() })
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Ismaili 101")
            .navigationDestination(for: Chapter.self) { ChapterDetailView(chapter: $0) }
        }
    }

    private var progressHeader: some View {
        let value = progress.progress(outOf: vm.chapters.count)
        return HStack(spacing: 16) {
            ZStack {
                Circle().stroke(Color.emerald.opacity(0.15), lineWidth: 8)
                Circle()
                    .trim(from: 0, to: value)
                    .stroke(LinearGradient.goldShine, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.spring(), value: value)
                Text("\(Int(value * 100))%")
                    .font(.subheadline.bold())
            }
            .frame(width: 64, height: 64)

            VStack(alignment: .leading, spacing: 4) {
                Text("Your learning path")
                    .font(.headline)
                Text("\(progress.completedChapters.count) of \(vm.chapters.count) chapters complete")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .card()
    }
}

struct ChapterRow: View {
    let chapter: Chapter
    let isDone: Bool

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: chapter.symbol)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 52, height: 52)
                .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 14, style: .continuous))

            VStack(alignment: .leading, spacing: 3) {
                Text("Chapter \(chapter.id)")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(Color.emerald)
                Text(chapter.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(chapter.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            Image(systemName: isDone ? "checkmark.seal.fill" : "chevron.right")
                .foregroundStyle(isDone ? Color.gold : Color.secondary)
                .font(isDone ? .title3 : .body)
        }
        .card()
    }
}
