import SwiftUI

// MARK: - Learn

final class LearnViewModel: ObservableObject {
    let chapters: [Chapter]
    init(chapters: [Chapter] = ChaptersData.all) { self.chapters = chapters }
}

extension QuizQuestion {
    /// Same question with its options in random order (keeps answers from always being "A").
    func withShuffledOptions() -> QuizQuestion {
        let order = options.indices.shuffled()
        return QuizQuestion(prompt: prompt,
                            options: order.map { options[$0] },
                            correctIndex: order.firstIndex(of: correctIndex) ?? 0,
                            explanation: explanation)
    }
}

/// One chapter's knowledge check: a bank of questions served in rounds,
/// favouring questions the learner hasn't mastered yet.
final class QuizViewModel: ObservableObject {
    static let roundSize = 5

    let bank: [QuizQuestion]
    @Published private(set) var questions: [QuizQuestion] = []   // current round
    @Published private(set) var selections: [Int: Int] = [:]     // question index -> chosen option
    @Published private(set) var round = 0
    /// Called when a question is answered correctly (used to record mastery).
    var onCorrect: ((QuizQuestion) -> Void)?

    init(bank: [QuizQuestion]) { self.bank = bank }

    var hasStarted: Bool { round > 0 }

    func startRound(mastered: Set<String>) {
        let fresh = bank.filter { !mastered.contains($0.prompt) }.shuffled()
        let review = bank.filter { mastered.contains($0.prompt) }.shuffled()
        let picked = Array((fresh + review).prefix(Self.roundSize))
        withAnimation(.spring()) {
            questions = picked.map { $0.withShuffledOptions() }
            selections = [:]
            round += 1
        }
    }

    func select(_ option: Int, for questionIndex: Int) {
        guard selections[questionIndex] == nil else { return }  // lock first answer
        withAnimation(.spring()) { selections[questionIndex] = option }
        let question = questions[questionIndex]
        if option == question.correctIndex {
            Haptics.success()
            onCorrect?(question)
        } else {
            Haptics.error()
        }
    }

    var isFinished: Bool { !questions.isEmpty && selections.count == questions.count }

    var score: Int {
        selections.filter { questions[$0.key].correctIndex == $0.value }.count
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

/// A search result outside the Q&A: a chapter, a Daily Path reading or a guide.
enum SearchHit: Hashable, Identifiable {
    case chapter(Chapter)
    case daily(DailyReading)
    case guide(GuidePage)

    var id: String {
        switch self {
        case .chapter(let c): return "chapter-\(c.id)"
        case .daily(let d): return "daily-\(d.day)"
        case .guide(let g): return "guide-\(g.title)"
        }
    }

    var title: String {
        switch self {
        case .chapter(let c): return "Chapter \(c.id): \(c.title)"
        case .daily(let d): return "Day \(d.day): \(d.title)"
        case .guide(let g): return g.title
        }
    }

    var kind: String {
        switch self {
        case .chapter: return "Chapter"
        case .daily: return "Daily Path"
        case .guide: return "Guide"
        }
    }

    var symbol: String {
        switch self {
        case .chapter(let c): return c.symbol
        case .daily(let d): return d.symbol
        case .guide(let g): return g.symbol
        }
    }
}

final class ExploreViewModel: ObservableObject {
    @Published var query = ""
    @Published var expanded: Set<String> = []
    private let items: [QAItem]

    init(items: [QAItem] = QAData.all) { self.items = items }

    static let suggestions = ["Purpose", "Death", "Creation", "Pets", "Nasir Khusraw", "Evolution"]

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

    /// Matches across chapters, lessons, Daily Path readings and guides.
    var lessonHits: [SearchHit] {
        let words = query.lowercased().split(separator: " ").map(String.init).filter { $0.count > 1 }
        guard !words.isEmpty else { return [] }
        func matches(_ parts: [String]) -> Bool {
            let text = parts.joined(separator: " ").lowercased()
            return words.allSatisfy { text.contains($0) }
        }
        var hits: [SearchHit] = []
        for chapter in ChaptersData.all {
            let parts = [chapter.title, chapter.subtitle] + chapter.overview
                + chapter.keyTerms.flatMap { [$0.term, $0.definition] }
                + chapter.lessons.flatMap { [$0.heading] + $0.body }
            if matches(parts) { hits.append(.chapter(chapter)) }
        }
        for reading in DailyData.all where matches([reading.title] + reading.paragraphs) {
            hits.append(.daily(reading))
        }
        for page in GuideData.all {
            let parts = [page.title, page.subtitle, page.intro] + page.sections.flatMap { [$0.heading] + $0.body }
            if matches(parts) { hits.append(.guide(page)) }
        }
        return Array(hits.prefix(12))
    }

    func toggle(_ item: QAItem) {
        Haptics.tap()
        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
            if expanded.contains(item.id) { expanded.remove(item.id) } else { expanded.insert(item.id) }
        }
    }
}
