import SwiftUI

final class TrueFalseViewModel: ObservableObject {
    static let duration: Double = 60

    @Published private(set) var deck: [TrueFalseStatement] = []
    @Published private(set) var index = 0
    @Published private(set) var timeLeft = duration
    @Published private(set) var score = 0
    @Published private(set) var streak = 0
    @Published private(set) var answered = 0
    @Published private(set) var correct = 0
    @Published private(set) var feedback: (correct: Bool, explanation: String)?
    @Published private(set) var isRunning = false
    @Published private(set) var isOver = false

    var current: TrueFalseStatement? { deck.indices.contains(index) ? deck[index] : nil }

    func start() {
        withAnimation(.spring()) {
            deck = TrueFalseData.all.shuffled()
            index = 0
            timeLeft = Self.duration
            score = 0
            streak = 0
            answered = 0
            correct = 0
            feedback = nil
            isOver = false
            isRunning = true
        }
        Haptics.tap(.medium)
    }

    func tick(_ delta: Double) {
        guard isRunning else { return }
        timeLeft = max(0, timeLeft - delta)
        if timeLeft == 0 { finish() }
    }

    func answer(_ value: Bool) {
        guard isRunning, feedback == nil, let statement = current else { return }
        let isRight = statement.isTrue == value
        answered += 1
        if isRight {
            correct += 1
            streak += 1
            score += 10 + (streak >= 3 ? 5 : 0)   // streak bonus from the third in a row
            Haptics.success()
        } else {
            streak = 0
            Haptics.error()
        }
        withAnimation(.spring()) { feedback = (isRight, statement.explanation) }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) { [weak self] in
            guard let self, self.isRunning else { return }
            withAnimation(.spring()) {
                self.feedback = nil
                self.index += 1
            }
            if self.current == nil { self.finish() }
        }
    }

    private func finish() {
        guard isRunning else { return }
        withAnimation(.spring()) {
            isRunning = false
            isOver = true
            feedback = nil
        }
    }
}

struct TrueFalseGameView: View {
    @StateObject private var vm = TrueFalseViewModel()
    @EnvironmentObject private var progress: ProgressStore
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            AmbientBackground()
            VStack(spacing: 18) {
                if vm.isRunning, let statement = vm.current {
                    header
                    statementCard(statement)
                    Spacer(minLength: 0)
                    buttons
                } else if vm.isOver {
                    Spacer()
                    GameOverPanel(title: "Time!",
                                  detail: "Score \(vm.score) · \(vm.correct) of \(vm.answered) correct") {
                        vm.start()
                    }
                    Spacer()
                } else {
                    Spacer()
                    intro
                    Spacer()
                }
            }
            .padding()
        }
        .navigationTitle("True or False")
        .navigationBarTitleDisplayMode(.inline)
        .onReceive(timer) { _ in vm.tick(0.1) }
        .onChange(of: vm.isOver) { over in
            if over { progress.record(vm.score, for: Game.trueFalse.rawValue) }
        }
    }

    private var intro: some View {
        VStack(spacing: 14) {
            Image(systemName: "bolt.fill")
                .font(.system(size: 48))
                .foregroundStyle(LinearGradient.goldShine)
            Text("True or False Blitz")
                .font(.title2.bold())
            Text("You have 60 seconds. +10 for each correct answer, +5 bonus from three in a row.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            Button { vm.start() } label: {
                Text("Start")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
            .buttonStyle(SpringButtonStyle())
        }
        .card()
    }

    private var header: some View {
        VStack(spacing: 8) {
            HStack {
                Label("\(Int(vm.timeLeft.rounded(.up)))s", systemImage: "timer")
                    .font(.headline.monospacedDigit())
                    .foregroundStyle(vm.timeLeft < 10 ? .red : Color.emerald)
                Spacer()
                Text("Score \(vm.score)")
                    .font(.headline.monospacedDigit())
                if vm.streak >= 3 {
                    PillTag(text: "🔥 \(vm.streak)", color: .orange)
                }
            }
            ProgressView(value: vm.timeLeft, total: TrueFalseViewModel.duration)
                .tint(vm.timeLeft < 10 ? .red : Color.gold)
        }
        .card()
    }

    private func statementCard(_ statement: TrueFalseStatement) -> some View {
        VStack(spacing: 14) {
            Text(statement.statement)
                .font(.title3.weight(.semibold))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            if let feedback = vm.feedback {
                VStack(spacing: 6) {
                    Label(feedback.correct ? "Correct!" : "Not quite",
                          systemImage: feedback.correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .font(.headline)
                        .foregroundStyle(feedback.correct ? Color.emerald : .red)
                    Text(feedback.explanation)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
        .frame(maxWidth: .infinity, minHeight: 180)
        .card()
        .id(statement.id)
        .transition(.asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity), removal: .opacity))
    }

    private var buttons: some View {
        HStack(spacing: 14) {
            answerButton("False", symbol: "xmark", color: .red) { vm.answer(false) }
            answerButton("True", symbol: "checkmark", color: .emerald) { vm.answer(true) }
        }
    }

    private func answerButton(_ title: String, symbol: String, color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Label(title, systemImage: symbol)
                .font(.title3.bold())
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(color, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(SpringButtonStyle())
        .disabled(vm.feedback != nil)
    }
}
