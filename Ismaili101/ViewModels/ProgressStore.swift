import Foundation

/// App-wide learning progress, persisted in UserDefaults.
final class ProgressStore: ObservableObject {
    @Published private(set) var completedChapters: Set<Int> = []
    @Published private(set) var bestJeopardyScore: Int = 0
    /// Chapter id -> prompts of questions answered correctly at least once.
    @Published private(set) var mastered: [Int: Set<String>] = [:]
    /// Daily Path days the user has finished.
    @Published private(set) var readDays: Set<Int> = []
    /// Best scores for the other games, keyed by game name.
    @Published private(set) var bestScores: [String: Int] = [:]
    let startDate: Date

    private let defaults: UserDefaults

    private enum Key {
        static let chapters = "completedChapters"
        static let bestJeopardy = "bestJeopardyScore"
        static let mastered = "masteredQuestions"
        static let readDays = "dailyReadDays"
        static let startDate = "dailyStartDate"
        static let bestScores = "bestGameScores"
    }

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        completedChapters = Set(defaults.array(forKey: Key.chapters) as? [Int] ?? [])
        bestJeopardyScore = defaults.integer(forKey: Key.bestJeopardy)
        let storedMastered = defaults.dictionary(forKey: Key.mastered) as? [String: [String]] ?? [:]
        mastered = Dictionary(uniqueKeysWithValues: storedMastered.compactMap { key, value in
            Int(key).map { ($0, Set(value)) }
        })
        readDays = Set(defaults.array(forKey: Key.readDays) as? [Int] ?? [])
        bestScores = defaults.dictionary(forKey: Key.bestScores) as? [String: Int] ?? [:]
        if let date = defaults.object(forKey: Key.startDate) as? Date {
            startDate = date
        } else {
            startDate = Calendar.current.startOfDay(for: Date())
            defaults.set(startDate, forKey: Key.startDate)
        }
    }

    // MARK: Chapters

    func isCompleted(_ chapter: Chapter) -> Bool {
        completedChapters.contains(chapter.id)
    }

    func markCompleted(_ chapter: Chapter) {
        guard !completedChapters.contains(chapter.id) else { return }
        completedChapters.insert(chapter.id)
        defaults.set(Array(completedChapters), forKey: Key.chapters)
    }

    func progress(outOf total: Int) -> Double {
        total == 0 ? 0 : Double(completedChapters.count) / Double(total)
    }

    // MARK: Quiz mastery

    func masteredCount(for chapter: Chapter) -> Int {
        mastered[chapter.id]?.count ?? 0
    }

    func isMastered(_ question: QuizQuestion, in chapter: Chapter) -> Bool {
        mastered[chapter.id]?.contains(question.prompt) ?? false
    }

    func markMastered(_ question: QuizQuestion, in chapter: Chapter) {
        var prompts = mastered[chapter.id] ?? []
        guard prompts.insert(question.prompt).inserted else { return }
        mastered[chapter.id] = prompts
        let encoded = Dictionary(uniqueKeysWithValues: mastered.map { (String($0.key), Array($0.value)) })
        defaults.set(encoded, forKey: Key.mastered)
    }

    // MARK: Daily Path

    /// Day number unlocked today: day 1 on the first launch, one more each calendar day.
    var unlockedDay: Int {
        let days = Calendar.current.dateComponents([.day], from: startDate,
                                                   to: Calendar.current.startOfDay(for: Date())).day ?? 0
        return max(1, days + 1)
    }

    func markRead(day: Int) {
        guard readDays.insert(day).inserted else { return }
        defaults.set(Array(readDays), forKey: Key.readDays)
    }

    // MARK: Games

    func recordJeopardyScore(_ score: Int) {
        guard score > bestJeopardyScore else { return }
        bestJeopardyScore = score
        defaults.set(score, forKey: Key.bestJeopardy)
    }

    func best(for game: String) -> Int { bestScores[game] ?? 0 }

    func record(_ score: Int, for game: String) {
        guard score > best(for: game) else { return }
        bestScores[game] = score
        defaults.set(bestScores, forKey: Key.bestScores)
    }
}
