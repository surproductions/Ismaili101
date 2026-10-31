import SwiftUI

enum LearnRoute: Hashable {
    case path
    case daily(Int)
    case faithScience
    case guide(GuidePage)
    case about
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
                    VStack(spacing: 14) {
                        TodayCard()
                        NavigationLink(value: LearnRoute.path) {
                            Label("See the full 28-day Daily Path", systemImage: "calendar")
                                .font(.subheadline.weight(.semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal, 4)
                        progressHeader

                        SectionHeader(title: "Explore more")
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)], spacing: 12) {
                            NavigationLink(value: LearnRoute.faithScience) {
                                ExploreTile(title: "Faith & Science", symbol: "atom")
                            }
                            .buttonStyle(SpringButtonStyle())
                            ForEach(GuideData.all) { page in
                                NavigationLink(value: LearnRoute.guide(page)) {
                                    ExploreTile(title: page.title, symbol: page.symbol)
                                }
                                .buttonStyle(SpringButtonStyle())
                            }
                        }

                        SectionHeader(title: "Chapters")
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
                case .guide(let page):
                    GuideView(page: page)
                case .about:
                    AboutView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(value: LearnRoute.about) {
                        Image(systemName: "info.circle")
                    }
                    .accessibilityLabel("About and sources")
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
        case .festivals: path.append(LearnRoute.guide(GuideData.festivals))
        case .about: path.append(LearnRoute.about)
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
                Label(progress.streak == 0 ? "Learn today to start a streak"
                      : (progress.streak == 1 ? "1-day streak" : "\(progress.streak)-day streak"),
                      systemImage: "flame.fill")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(progress.streak > 0 ? Color.orange : Color.secondary)
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

/// Compact square tile for the "Explore more" grid.
struct ExploreTile: View {
    let title: String
    let symbol: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: symbol)
                .font(.title3)
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
            Text(title)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.primary)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .minimumScaleFactor(0.85)
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, minHeight: 104, alignment: .topLeading)
        .card(cornerRadius: 18)
    }
}
