import SwiftUI

final class TimelineGameViewModel: ObservableObject {
    static let roundSize = 6

    @Published private(set) var pool: [Imam] = []      // shuffled cards to choose from
    @Published private(set) var placed: [Imam] = []    // correctly ordered so far
    @Published private(set) var mistakes = 0
    @Published private(set) var wrongId: Int?

    init() { newGame() }

    private var sorted: [Imam] { (pool + placed).sorted { $0.number < $1.number } }
    var isFinished: Bool { pool.isEmpty && !placed.isEmpty }
    var score: Int { max(0, placed.count * 100 - mistakes * 20) }

    func newGame() {
        let picked = Array(ImamsData.all.shuffled().prefix(Self.roundSize))
        withAnimation(.spring()) {
            pool = picked.shuffled()
            placed = []
            mistakes = 0
            wrongId = nil
        }
    }

    func tap(_ imam: Imam) {
        guard let next = sorted.first(where: { candidate in !placed.contains(candidate) }) else { return }
        if imam == next {
            Haptics.success()
            withAnimation(.spring()) {
                placed.append(imam)
                pool.removeAll { $0 == imam }
            }
        } else {
            Haptics.error()
            mistakes += 1
            withAnimation(.spring()) { wrongId = imam.number }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                withAnimation(.spring()) { self?.wrongId = nil }
            }
        }
    }
}

struct TimelineGameView: View {
    @StateObject private var vm = TimelineGameViewModel()
    @EnvironmentObject private var progress: ProgressStore

    var body: some View {
        ZStack {
            AmbientBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Tap the earliest Imam first, then the next…")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Spacer()
                        PillTag(text: "Mistakes: \(vm.mistakes)", color: vm.mistakes == 0 ? .emerald : .orange)
                    }

                    if !vm.placed.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Label("Your timeline", systemImage: "list.number")
                                .font(.headline)
                                .foregroundStyle(Color.emerald)
                            ForEach(vm.placed) { imam in
                                HStack(spacing: 10) {
                                    Text("\(imam.number)")
                                        .font(.caption.bold().monospacedDigit())
                                        .foregroundStyle(.white)
                                        .frame(width: 30, height: 30)
                                        .background(Circle().fill(LinearGradient.brand))
                                    VStack(alignment: .leading, spacing: 1) {
                                        Text(imam.name).font(.subheadline.weight(.semibold))
                                        Text(imam.period).font(.caption).foregroundStyle(.secondary)
                                    }
                                }
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                            }
                        }
                        .card()
                    }

                    ForEach(vm.pool) { imam in
                        Button { vm.tap(imam) } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(imam.name)
                                        .font(.headline)
                                        .foregroundStyle(.primary)
                                        .multilineTextAlignment(.leading)
                                    Text(imam.summary)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                                Image(systemName: "hand.tap.fill").foregroundStyle(Color.emerald)
                            }
                            .padding(14)
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(vm.wrongId == imam.number ? Color.red.opacity(0.18) : Color(UIColor.secondarySystemFill))
                            )
                            .offset(x: vm.wrongId == imam.number ? 6 : 0)
                        }
                        .buttonStyle(SpringButtonStyle())
                        .transition(.scale.combined(with: .opacity))
                    }

                    if vm.isFinished {
                        GameOverPanel(title: "Timeline complete!",
                                      detail: "Score \(vm.score) · \(vm.mistakes) mistake\(vm.mistakes == 1 ? "" : "s")") {
                            vm.newGame()
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Imam Timeline")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button { vm.newGame() } label: { Label("New game", systemImage: "arrow.counterclockwise") }
            }
        }
        .onChange(of: vm.isFinished) { done in
            if done { progress.record(vm.score, for: Game.timeline.rawValue) }
        }
    }
}
