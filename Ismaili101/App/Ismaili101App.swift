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

struct RootTabView: View {
    var body: some View {
        TabView {
            LearnView()
                .tabItem { Label("Learn", systemImage: "book.fill") }
            ImamsView()
                .tabItem { Label("History", systemImage: "crown.fill") }
            ImpactView()
                .tabItem { Label("Impact", systemImage: "globe.americas.fill") }
            PlayHubView()
                .tabItem { Label("Play", systemImage: "gamecontroller.fill") }
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
        }
    }
}
