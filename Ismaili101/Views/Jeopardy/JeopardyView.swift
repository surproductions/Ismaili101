import SwiftUI

struct JeopardyView: View {
    @StateObject private var vm = JeopardyViewModel()
    @EnvironmentObject private var progress: ProgressStore

    var body: some View {
        NavigationStack {
            ZStack {
                AmbientBackground()
                ScrollView {
                    VStack(spacing: 16) {
                        Scoreboard(score: vm.score, streak: vm.streak,
                                   multiplier: vm.multiplier, best: progress.bestJeopardyScore)
                        board
                        if vm.isGameOver { gameOverCard }
                    }
                    .padding()
                }
            }
            .navigationTitle("Jeopardy")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Haptics.tap(.medium)
                        vm.reset()
                    } label: {
                        Label("New game", systemImage: "arrow.counterclockwise")
                    }
                }
            }
            .sheet(item: $vm.activeClue) { clue in
                ClueSheet(clue: clue, vm: vm)
            }
            .onChange(of: vm.isGameOver) { over in
                if over { progress.recordJeopardyScore(vm.score) }
            }
        }
    }

    /// 5 columns (categories) x 5 rows (values).
    private var board: some View {
        HStack(alignment: .top, spacing: 6) {
            ForEach(vm.categories) { category in
                VStack(spacing: 6) {
                    VStack(spacing: 4) {
                        Image(systemName: category.symbol)
                            .font(.subheadline)
                        Text(category.title)
                            .font(.system(size: 10, weight: .bold))
                            .lineLimit(2)
                            .minimumScaleFactor(0.7)
                            .multilineTextAlignment(.center)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, minHeight: 58)
                    .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 10, style: .continuous))

                    ForEach(category.clues) { clue in
                        ClueTile(clue: clue, answer: vm.answer(for: clue)) { vm.open(clue) }
                    }
                }
            }
        }
    }

    private var gameOverCard: some View {
        VStack(spacing: 10) {
            Image(systemName: "trophy.fill")
                .font(.system(size: 40))
                .foregroundStyle(LinearGradient.goldShine)
            Text("Board cleared!")
                .font(.title2.bold())
            Text("Final score: \(vm.score) · \(vm.correctCount)/\(vm.totalClues) correct")
                .foregroundStyle(.secondary)
            Button {
                Haptics.tap(.medium)
                vm.reset()
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

struct Scoreboard: View {
    let score: Int
    let streak: Int
    let multiplier: Double
    let best: Int

    var body: some View {
        HStack {
            stat("Score", "\(score)", color: .emerald)
            Divider().frame(height: 36)
            stat("Streak", "\(streak) 🔥", color: .orange)
            Divider().frame(height: 36)
            stat("Bonus", multiplier == 1 ? "x1" : String(format: "x%g", multiplier), color: .gold)
            Divider().frame(height: 36)
            stat("Best", "\(best)", color: .secondary)
        }
        .card()
    }

    private func stat(_ title: String, _ value: String, color: Color) -> some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.title3.bold().monospacedDigit())
                .foregroundStyle(color)
                .animation(.spring(), value: value)
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ClueTile: View {
    let clue: JeopardyClue
    let answer: JeopardyViewModel.Answer?
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(fill)
                if let answer {
                    Image(systemName: answer.correct ? "checkmark" : "xmark")
                        .font(.headline)
                        .foregroundStyle(answer.correct ? Color.emerald : .red)
                } else {
                    Text("\(clue.value)")
                        .font(.system(size: 15, weight: .heavy, design: .rounded))
                        .minimumScaleFactor(0.7)
                        .foregroundStyle(Color.gold)
                }
            }
            .frame(height: 52)
        }
        .buttonStyle(SpringButtonStyle())
        .disabled(answer != nil)
        .accessibilityLabel(answer == nil ? "\(clue.value) points" : "Answered")
    }

    private var fill: AnyShapeStyle {
        guard let answer else { return AnyShapeStyle(.ultraThinMaterial) }
        return AnyShapeStyle((answer.correct ? Color.emerald : Color.red).opacity(0.12))
    }
}

struct ClueSheet: View {
    let clue: JeopardyClue
    @ObservedObject var vm: JeopardyViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        let answer = vm.answer(for: clue)
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                PillTag(text: "\(clue.value) points", color: .gold)
                if vm.multiplier > 1 && answer == nil {
                    PillTag(text: String(format: "Streak bonus x%g", vm.multiplier), color: .orange)
                }
                Spacer()
            }
            Text(clue.question)
                .font(.title3.bold())
                .fixedSize(horizontal: false, vertical: true)

            ForEach(Array(clue.options.enumerated()), id: \.offset) { index, option in
                OptionButton(text: option, state: status(for: index, answer: answer)) {
                    vm.submit(index, for: clue)
                }
            }

            if let answer {
                VStack(alignment: .leading, spacing: 8) {
                    Text(answer.correct ? "Correct! +\(answer.points)" : "Not quite. \(answer.points)")
                        .font(.headline)
                        .foregroundStyle(answer.correct ? Color.emerald : .red)
                    Text(clue.explanation)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))

                Button {
                    Haptics.tap()
                    dismiss()
                } label: {
                    Text("Back to board")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                .buttonStyle(SpringButtonStyle())
            }
            Spacer(minLength: 0)
        }
        .padding(24)
        .presentationDetents([.large])
        .interactiveDismissDisabled(answer == nil)   // must answer once opened
    }

    private func status(for index: Int, answer: JeopardyViewModel.Answer?) -> OptionButton.Status {
        guard let answer else { return .idle }
        if index == clue.correctIndex { return .correct }
        if index == answer.chosen { return .wrong }
        return .dimmed
    }
}
