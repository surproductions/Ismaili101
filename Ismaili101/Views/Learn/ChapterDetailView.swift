import SwiftUI

struct ChapterDetailView: View {
    let chapter: Chapter
    @EnvironmentObject private var progress: ProgressStore
    @StateObject private var quiz: QuizViewModel

    init(chapter: Chapter) {
        self.chapter = chapter
        _quiz = StateObject(wrappedValue: QuizViewModel(bank: chapter.quiz))
    }

    var body: some View {
        ZStack {
            AmbientBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    hero
                    section("Overview", symbol: "text.book.closed.fill") {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(chapter.overview, id: \.self) { paragraph in
                                Text(paragraph).fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .card()
                    }
                    if !chapter.lessons.isEmpty {
                        section("Go deeper", symbol: "books.vertical.fill") {
                            Text("\(chapter.lessons.count) lessons · tap to open each one.")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                            ForEach(Array(chapter.lessons.enumerated()), id: \.element.id) { index, lesson in
                                LessonCard(lesson: lesson, number: index + 1)
                            }
                        }
                    }
                    section("Key terms", symbol: "hand.tap.fill") {
                        Text("Tap a card to reveal its meaning.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        ForEach(chapter.keyTerms) { KeyTermCard(term: $0) }
                    }
                    section("Knowledge check", symbol: "checkmark.circle.fill") {
                        KnowledgeCheckView(vm: quiz,
                                           mastered: progress.masteredCount(for: chapter),
                                           total: chapter.quiz.count,
                                           nextRound: startRound)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: quiz.isFinished) { finished in
            if finished { progress.markCompleted(chapter) }
        }
        .onAppear {
            quiz.onCorrect = { [progress, chapter] question in
                progress.markMastered(question, in: chapter)
            }
            if !quiz.hasStarted { startRound() }
        }
    }

    private func startRound() {
        quiz.startRound(mastered: progress.mastered[chapter.id] ?? [])
    }

    private var hero: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: chapter.symbol)
                .font(.system(size: 34))
                .foregroundStyle(Color.gold)
            Text("Chapter \(chapter.id)")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.white.opacity(0.8))
            Text(chapter.title)
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
            Text(chapter.subtitle)
                .foregroundStyle(.white.opacity(0.85))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(22)
        .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 26, style: .continuous))
    }

    @ViewBuilder
    private func section<Content: View>(_ title: String, symbol: String,
                                        @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: symbol)
                .font(.title3.bold())
                .foregroundStyle(Color.emerald)
            content()
        }
    }
}

/// Flip card: shows the term, tap to reveal the definition.
struct KeyTermCard: View {
    let term: KeyTerm
    @State private var revealed = false

    var body: some View {
        Button {
            Haptics.tap()
            withAnimation(.spring(response: 0.45, dampingFraction: 0.75)) { revealed.toggle() }
        } label: {
            ZStack {
                face(front: true).opacity(revealed ? 0 : 1)
                face(front: false)
                    .opacity(revealed ? 1 : 0)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
            .rotation3DEffect(.degrees(revealed ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        }
        .buttonStyle(SpringButtonStyle())
        .accessibilityLabel(revealed ? "\(term.term): \(term.definition)" : "\(term.term). Double tap to reveal.")
    }

    private func face(front: Bool) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: front ? "questionmark.circle.fill" : "lightbulb.fill")
                .font(.title2)
                .foregroundStyle(front ? Color.emerald : Color.gold)
            VStack(alignment: .leading, spacing: 4) {
                Text(term.term).font(.headline).foregroundStyle(.primary)
                if !front {
                    Text(term.definition)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, minHeight: 56, alignment: .leading)
        .multilineTextAlignment(.leading)
        .card(cornerRadius: 16)
    }
}

struct KnowledgeCheckView: View {
    @ObservedObject var vm: QuizViewModel
    let mastered: Int
    let total: Int
    let nextRound: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Round \(vm.round) · \(QuizViewModel.roundSize) questions")
                        .font(.subheadline.weight(.semibold))
                    Spacer()
                    Text("\(mastered)/\(total) mastered")
                        .font(.subheadline.weight(.semibold).monospacedDigit())
                        .foregroundStyle(Color.gold)
                }
                ProgressView(value: Double(mastered), total: Double(max(total, 1)))
                    .tint(Color.gold)
                    .animation(.spring(), value: mastered)
            }
            .card()

            ForEach(Array(vm.questions.enumerated()), id: \.element.id) { index, question in
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(index + 1). \(question.prompt)")
                        .font(.headline)
                    ForEach(Array(question.options.enumerated()), id: \.offset) { optionIndex, option in
                        OptionButton(text: option,
                                     state: state(for: optionIndex, question: question, index: index)) {
                            vm.select(optionIndex, for: index)
                        }
                    }
                    if vm.selections[index] != nil {
                        Label(question.explanation, systemImage: "info.circle.fill")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }
                }
                .card()
            }

            if vm.isFinished {
                HStack {
                    Image(systemName: vm.score == vm.questions.count ? "star.fill" : "checkmark.seal.fill")
                        .foregroundStyle(Color.gold)
                    Text(mastered >= total
                         ? "\(vm.score)/\(vm.questions.count) — every question mastered!"
                         : "\(vm.score)/\(vm.questions.count) this round. Keep going!")
                        .font(.subheadline.weight(.semibold))
                    Spacer()
                    Button("Next round") {
                        Haptics.tap(.medium)
                        nextRound()
                    }
                    .font(.subheadline.bold())
                }
                .card()
                .transition(.scale.combined(with: .opacity))
            }
        }
    }

    private func state(for option: Int, question: QuizQuestion, index: Int) -> OptionButton.Status {
        guard let chosen = vm.selections[index] else { return .idle }
        if option == question.correctIndex { return .correct }
        if option == chosen { return .wrong }
        return .dimmed
    }
}

/// Shared multiple-choice button used by quizzes and the Jeopardy game.
struct OptionButton: View {
    enum Status { case idle, correct, wrong, dimmed }
    let text: String
    let state: Status
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.primary)
                Spacer()
                switch state {
                case .correct: Image(systemName: "checkmark.circle.fill").foregroundStyle(Color.emerald)
                case .wrong: Image(systemName: "xmark.circle.fill").foregroundStyle(.red)
                default: EmptyView()
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 14)
            .background(background, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
            .opacity(state == .dimmed ? 0.5 : 1)
        }
        .buttonStyle(SpringButtonStyle())
        .disabled(state != .idle)
    }

    private var background: Color {
        switch state {
        case .correct: return Color.emerald.opacity(0.18)
        case .wrong: return Color.red.opacity(0.15)
        default: return Color(UIColor.secondarySystemFill)
        }
    }
}
