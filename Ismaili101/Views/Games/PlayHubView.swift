import SwiftUI

enum Game: String, CaseIterable, Identifiable, Hashable {
    case jeopardy, match, trueFalse, timeline
    var id: String { rawValue }

    var title: String {
        switch self {
        case .jeopardy: return "Jeopardy"
        case .match: return "Match Up"
        case .trueFalse: return "True or False Blitz"
        case .timeline: return "Imam Timeline"
        }
    }

    var subtitle: String {
        switch self {
        case .jeopardy: return "25 clues across 5 categories, with streak bonuses"
        case .match: return "Pair each term with its meaning"
        case .trueFalse: return "60 seconds — how many can you get right?"
        case .timeline: return "Tap the Imams in historical order"
        }
    }

    var symbol: String {
        switch self {
        case .jeopardy: return "square.grid.3x3.fill"
        case .match: return "link"
        case .trueFalse: return "bolt.fill"
        case .timeline: return "list.number"
        }
    }
}

struct PlayHubView: View {
    @EnvironmentObject private var progress: ProgressStore
    @State private var path: [Game] = {
        switch LaunchScreen.current {
        case .jeopardy: return [.jeopardy]
        case .match: return [.match]
        case .truefalse: return [.trueFalse]
        case .timeline: return [.timeline]
        default: return []
        }
    }()

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                AmbientBackground()
                ScrollView {
                    VStack(spacing: 14) {
                        ForEach(Game.allCases) { game in
                            NavigationLink(value: game) { GameCard(game: game, best: best(for: game)) }
                                .buttonStyle(SpringButtonStyle())
                                .simultaneousGesture(TapGesture().onEnded { Haptics.tap() })
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Play")
            .navigationDestination(for: Game.self) { game in
                switch game {
                case .jeopardy: JeopardyView()
                case .match: MatchGameView()
                case .trueFalse: TrueFalseGameView()
                case .timeline: TimelineGameView()
                }
            }
        }
    }

    private func best(for game: Game) -> Int {
        game == .jeopardy ? progress.bestJeopardyScore : progress.best(for: game.rawValue)
    }
}

struct GameCard: View {
    let game: Game
    let best: Int

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: game.symbol)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 56, height: 56)
                .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            VStack(alignment: .leading, spacing: 4) {
                Text(game.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(game.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                if best > 0 {
                    PillTag(text: "Best: \(best)", color: .gold)
                }
            }
            Spacer()
            Image(systemName: "play.circle.fill")
                .font(.title)
                .foregroundStyle(Color.emerald)
        }
        .card()
    }
}

/// Shared end-of-game panel.
struct GameOverPanel: View {
    let title: String
    let detail: String
    let playAgain: () -> Void

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "trophy.fill")
                .font(.system(size: 40))
                .foregroundStyle(LinearGradient.goldShine)
            Text(title).font(.title2.bold())
            Text(detail)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Button {
                Haptics.tap(.medium)
                playAgain()
            } label: {
                Text("Play again")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
            .buttonStyle(SpringButtonStyle())
        }
        .card()
        .transition(.scale.combined(with: .opacity))
    }
}
