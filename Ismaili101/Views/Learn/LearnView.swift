import SwiftUI

enum LearnRoute: Hashable {
    case path
    case daily(Int)
    case faithScience
}

struct LearnView: View {
    @StateObject private var vm = LearnViewModel()
    @EnvironmentObject private var progress: ProgressStore
    @State private var path = NavigationPath()
    @State private var appliedLaunch = false

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                AmbientBackground()
                ScrollView {
                    VStack(spacing: 16) {
                        TodayCard()
                        NavigationLink(value: LearnRoute.path) {
                            Label("See the full 28-day Daily Path", systemImage: "calendar")
                                .font(.subheadline.weight(.semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal, 4)
                        FaithScienceCard()
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
            .navigationDestination(for: LearnRoute.self) { route in
                switch route {
                case .path:
                    DailyPathView()
                case .daily(let day):
                    DailyReadingView(reading: DailyData.all[day - 1])
                case .faithScience:
                    FaithScienceView()
                }
            }
            .onAppear(perform: applyLaunchScreen)
        }
    }

    private func applyLaunchScreen() {
        guard !appliedLaunch, let screen = LaunchScreen.current else { return }
        appliedLaunch = true
        switch screen {
        case .chapter: if let chapter = vm.chapters.first(where: { $0.id == 13 }) { path.append(chapter) }
        case .daily: path.append(LearnRoute.daily(1))
        case .path: path.append(LearnRoute.path)
        case .faith: path.append(LearnRoute.faithScience)
        default: break
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
