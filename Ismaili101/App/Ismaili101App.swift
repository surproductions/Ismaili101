import SwiftUI

@main
struct Ismaili101App: App {
    @StateObject private var progress = ProgressStore()

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(progress)
                .tint(.emerald)
        }
    }
}

enum AppTab: Int { case learn, history, impact, play, explore }

struct RootTabView: View {
    @State private var tab: AppTab = LaunchScreen.current?.tab ?? .learn

    var body: some View {
        TabView(selection: $tab) {
            LearnView()
                .tabItem { Label("Learn", systemImage: "book.fill") }
                .tag(AppTab.learn)
            ImamsView()
                .tabItem { Label("History", systemImage: "crown.fill") }
                .tag(AppTab.history)
            ImpactView()
                .tabItem { Label("Impact", systemImage: "globe.americas.fill") }
                .tag(AppTab.impact)
            PlayHubView()
                .tabItem { Label("Play", systemImage: "gamecontroller.fill") }
                .tag(AppTab.play)
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
                .tag(AppTab.explore)
        }
        .onChange(of: tab) { _ in Haptics.tap() }
    }
}

/// Opens a specific screen when launched with `-screen <name>`.
/// Used by the automated simulator screenshots; has no effect in normal use.
enum LaunchScreen: String {
    case learn, chapter, daily, path, faith, festivals, about
    case history, imam, journey, figures
    case impact, agency, contributions
    case play, jeopardy, match, truefalse, timeline
    case explore, compare, groups, search

    static let current: LaunchScreen? = {
        let args = ProcessInfo.processInfo.arguments
        guard let index = args.firstIndex(of: "-screen"), index + 1 < args.count else { return nil }
        return LaunchScreen(rawValue: args[index + 1])
    }()

    static func `is`(_ screen: LaunchScreen) -> Bool { current == screen }

    var tab: AppTab {
        switch self {
        case .learn, .chapter, .daily, .path, .faith, .festivals, .about: return .learn
        case .history, .imam, .journey, .figures: return .history
        case .impact, .agency, .contributions: return .impact
        case .play, .jeopardy, .match, .truefalse, .timeline: return .play
        case .explore, .compare, .groups, .search: return .explore
        }
    }
}
