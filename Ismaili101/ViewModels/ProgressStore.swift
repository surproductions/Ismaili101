import Foundation

/// App-wide learning progress, persisted in UserDefaults.
final class ProgressStore: ObservableObject {
    @Published private(set) var completedChapters: Set<Int> = []
    @Published private(set) var bestJeopardyScore: Int = 0

    private let defaults: UserDefaults
    private let chaptersKey = "completedChapters"
    private let bestScoreKey = "bestJeopardyScore"

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        completedChapters = Set(defaults.array(forKey: chaptersKey) as? [Int] ?? [])
        bestJeopardyScore = defaults.integer(forKey: bestScoreKey)
    }

    func isCompleted(_ chapter: Chapter) -> Bool {
        completedChapters.contains(chapter.id)
    }

    func markCompleted(_ chapter: Chapter) {
        guard !completedChapters.contains(chapter.id) else { return }
        completedChapters.insert(chapter.id)
        defaults.set(Array(completedChapters), forKey: chaptersKey)
    }

    func recordJeopardyScore(_ score: Int) {
        guard score > bestJeopardyScore else { return }
        bestJeopardyScore = score
        defaults.set(score, forKey: bestScoreKey)
    }

    func progress(outOf total: Int) -> Double {
        total == 0 ? 0 : Double(completedChapters.count) / Double(total)
    }
}
