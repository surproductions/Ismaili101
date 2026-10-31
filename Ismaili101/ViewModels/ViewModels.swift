import SwiftUI

// MARK: - Learn

final class LearnViewModel: ObservableObject {
    let chapters: [Chapter]
    init(chapters: [Chapter] = ChaptersData.all) { self.chapters = chapters }
}

/// State for one chapter's knowledge check.
final class QuizViewModel: ObservableObject {
    let questions: [QuizQuestion]
    @Published private(set) var selections: [Int: Int] = [:]   // question index -> chosen option

    init(questions: [QuizQuestion]) { self.questions = questions }

    func select(_ option: Int, for questionIndex: Int) {
        guard selections[questionIndex] == nil else { return }  // lock first answer
        withAnimation(.spring()) { selections[questionIndex] = option }
        if option == questions[questionIndex].correctIndex {
            Haptics.success()
        } else {
            Haptics.error()
        }
    }

    var isFinished: Bool { selections.count == questions.count }

    var score: Int {
        selections.filter { questions[$0.key].correctIndex == $0.value }.count
    }

    func reset() {
        withAnimation(.spring()) { selections = [:] }
    }
}

// MARK: - Imams

final class ImamsViewModel: ObservableObject {
    @Published var selectedEra: ImamEra = .all
    private let imams: [Imam]

    init(imams: [Imam] = ImamsData.all) { self.imams = imams }

    var filtered: [Imam] {
        selectedEra == .all ? imams : imams.filter { $0.era == selectedEra }
    }

    func select(_ era: ImamEra) {
        Haptics.tap()
        withAnimation(.spring()) { selectedEra = era }
    }
}

// MARK: - Jeopardy

final class JeopardyViewModel: ObservableObject {
    struct Answer { let chosen: Int; let correct: Bool; let points: Int }

    let categories: [JeopardyCategory]
    @Published private(set) var score = 0
    @Published private(set) var streak = 0
    @Published private(set) var answers: [String: Answer] = [:]   // clue id -> answer
    @Published var activeClue: JeopardyClue?

    init(categories: [JeopardyCategory] = JeopardyData.categories) {
        self.categories = categories
    }

    /// Streak multiplier: x1, then x1.5 after 2 in a row, x2 after 4 in a row.
    var multiplier: Double {
        switch streak {
        case 4...: return 2
        case 2...: return 1.5
        default: return 1
        }
    }

    var totalClues: Int { categories.reduce(0) { $0 + $1.clues.count } }
    var isGameOver: Bool { answers.count == totalClues }
    var correctCount: Int { answers.values.filter(\.correct).count }

    func isAnswered(_ clue: JeopardyClue) -> Bool { answers[clue.id] != nil }
    func answer(for clue: JeopardyClue) -> Answer? { answers[clue.id] }

    func open(_ clue: JeopardyClue) {
        guard !isAnswered(clue) else { return }
        Haptics.tap(.medium)
        activeClue = clue
    }

    func submit(_ option: Int, for clue: JeopardyClue) {
        guard !isAnswered(clue) else { return }
        let correct = option == clue.correctIndex
        let points: Int
        if correct {
            points = Int((Double(clue.value) * multiplier).rounded())
            streak += 1
            Haptics.success()
        } else {
            // Wrong answers lose half the clue value — gentler than classic Jeopardy.
            points = -clue.value / 2
            streak = 0
            Haptics.error()
        }
        withAnimation(.spring()) {
            score += points
            answers[clue.id] = Answer(chosen: option, correct: correct, points: points)
        }
    }

    func reset() {
        withAnimation(.spring()) {
            score = 0
            streak = 0
            answers = [:]
            activeClue = nil
        }
    }
}

// MARK: - Explore

final class ExploreViewModel: ObservableObject {
    @Published var query = ""
    @Published var expanded: Set<String> = []
    private let items: [QAItem]

    init(items: [QAItem] = QAData.all) { self.items = items }

    static let suggestions = ["Evolution", "Aga Khan title", "Autism", "LGBTQ+", "Du'a"]

    var results: [QAItem] {
        let q = query.trimmingCharacters(in: .whitespaces).lowercased()
        guard !q.isEmpty else { return items }
        let words = q.split(separator: " ").map(String.init)
        return items.filter { item in
            let haystack = ([item.question, item.category] + item.tags + item.answer)
                .joined(separator: " ")
                .lowercased()
            return words.allSatisfy { haystack.contains($0) }
        }
    }

    func toggle(_ item: QAItem) {
        Haptics.tap()
        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
            if expanded.contains(item.id) { expanded.remove(item.id) } else { expanded.insert(item.id) }
        }
    }
}
