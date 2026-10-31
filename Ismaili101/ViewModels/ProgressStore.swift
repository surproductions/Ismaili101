import Foundation
import UserNotifications

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
    /// Days (yyyy-MM-dd) on which the learner did something — used for the streak.
    @Published private(set) var activeDays: Set<String> = []
    @Published private(set) var reminderEnabled = false
    @Published private(set) var reminderTime: DateComponents = DateComponents(hour: 8, minute: 0)
    let startDate: Date

    private let defaults: UserDefaults

    private enum Key {
        static let chapters = "completedChapters"
        static let bestJeopardy = "bestJeopardyScore"
        static let mastered = "masteredQuestions"
        static let readDays = "dailyReadDays"
        static let startDate = "dailyStartDate"
        static let bestScores = "bestGameScores"
        static let activeDays = "activeDays"
        static let reminderEnabled = "reminderEnabled"
        static let reminderHour = "reminderHour"
        static let reminderMinute = "reminderMinute"
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
        activeDays = Set(defaults.stringArray(forKey: Key.activeDays) ?? [])
        reminderEnabled = defaults.bool(forKey: Key.reminderEnabled)
        if defaults.object(forKey: Key.reminderHour) != nil {
            reminderTime = DateComponents(hour: defaults.integer(forKey: Key.reminderHour),
                                          minute: defaults.integer(forKey: Key.reminderMinute))
        }
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
        recordActivity()
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
        recordActivity()
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
        recordActivity()
    }

    // MARK: Games

    func recordJeopardyScore(_ score: Int) {
        guard score > bestJeopardyScore else { return }
        bestJeopardyScore = score
        defaults.set(score, forKey: Key.bestJeopardy)
    }

    func best(for game: String) -> Int { bestScores[game] ?? 0 }

    func record(_ score: Int, for game: String) {
        recordActivity()
        guard score > best(for: game) else { return }
        bestScores[game] = score
        defaults.set(bestScores, forKey: Key.bestScores)
    }

    // MARK: Streak

    private static let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    /// Marks today as an active learning day.
    func recordActivity(on date: Date = Date()) {
        let key = Self.dayFormatter.string(from: date)
        guard activeDays.insert(key).inserted else { return }
        defaults.set(Array(activeDays), forKey: Key.activeDays)
    }

    /// Consecutive active days ending today (or yesterday, so a streak survives until the day is over).
    var streak: Int {
        let calendar = Calendar.current
        var day = calendar.startOfDay(for: Date())
        if !activeDays.contains(Self.dayFormatter.string(from: day)) {
            guard let yesterday = calendar.date(byAdding: .day, value: -1, to: day) else { return 0 }
            day = yesterday
        }
        var count = 0
        while activeDays.contains(Self.dayFormatter.string(from: day)) {
            count += 1
            guard let previous = calendar.date(byAdding: .day, value: -1, to: day) else { break }
            day = previous
        }
        return count
    }

    // MARK: Daily reminder

    private static let reminderID = "dailyPathReminder"

    /// Turns the daily reminder on (asking permission if needed) or off.
    func setReminder(enabled: Bool) {
        let center = UNUserNotificationCenter.current()
        guard enabled else {
            center.removePendingNotificationRequests(withIdentifiers: [Self.reminderID])
            reminderEnabled = false
            defaults.set(false, forKey: Key.reminderEnabled)
            return
        }
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            DispatchQueue.main.async {
                self.reminderEnabled = granted
                self.defaults.set(granted, forKey: Key.reminderEnabled)
                if granted { self.scheduleReminder() }
            }
        }
    }

    func setReminderTime(_ date: Date) {
        let parts = Calendar.current.dateComponents([.hour, .minute], from: date)
        reminderTime = DateComponents(hour: parts.hour ?? 8, minute: parts.minute ?? 0)
        defaults.set(reminderTime.hour, forKey: Key.reminderHour)
        defaults.set(reminderTime.minute, forKey: Key.reminderMinute)
        if reminderEnabled { scheduleReminder() }
    }

    var reminderDate: Date {
        Calendar.current.date(from: reminderTime) ?? Date()
    }

    private func scheduleReminder() {
        let content = UNMutableNotificationContent()
        content.title = "Your daily reading is ready"
        content.body = "Take three minutes with today's Daily Path in Ismaili 101."
        content.sound = .default
        let trigger = UNCalendarNotificationTrigger(dateMatching: reminderTime, repeats: true)
        let request = UNNotificationRequest(identifier: Self.reminderID, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [Self.reminderID])
        center.add(request)
    }
}
