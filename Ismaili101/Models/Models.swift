import Foundation

// All models are Codable so the bundled Swift datasets can be moved to JSON
// files (or fetched from a server) later without touching the views.

// MARK: - Learn

struct Chapter: Identifiable, Codable, Hashable {
    let id: Int              // chapter number
    let title: String
    let subtitle: String
    let symbol: String       // SF Symbol name
    let overview: [String]   // short paragraphs
    let keyTerms: [KeyTerm]
    var quiz: [QuizQuestion] // knowledge-check bank (25 per chapter)
    var lessons: [Lesson] = [] // "Go deeper" lessons shown after the overview
}

/// A longer reading inside a chapter.
struct Lesson: Identifiable, Codable, Hashable {
    var id: String { heading }
    let heading: String
    let symbol: String
    let body: [String]       // paragraphs
    var reflection: String? = nil  // optional question to think about
}

struct KeyTerm: Identifiable, Codable, Hashable {
    var id: String { term }
    let term: String
    let definition: String
}

struct QuizQuestion: Identifiable, Codable, Hashable {
    var id: String { prompt }
    let prompt: String
    let options: [String]
    let correctIndex: Int
    let explanation: String
}

// MARK: - Imams

enum ImamEra: String, Codable, CaseIterable, Identifiable {
    case all = "All"
    case early = "Early History"
    case fatimid = "Fatimid Era"
    case alamut = "Alamut / Persian"
    case modern = "Modern Era"

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .all: return "list.bullet"
        case .early: return "sunrise.fill"
        case .fatimid: return "building.columns.fill"
        case .alamut: return "mountain.2.fill"
        case .modern: return "globe"
        }
    }
}

struct Imam: Identifiable, Codable, Hashable {
    var id: Int { number }
    let number: Int
    let name: String
    let era: ImamEra
    let period: String      // e.g. "Imamat 1957–2025"
    let summary: String
    let coolFact: String
    let realm: String        // empire / state they ruled, or the power they lived under
    let residence: String    // where they lived
    let meanwhile: [String]  // what else was happening in the world
    var contemporaries: [String] = []  // world leaders and famous people alive at the time
    var isPresentImam: Bool = false
}

// MARK: - Impact

struct Institution: Identifiable, Hashable {
    var id: String { acronym }
    let acronym: String
    let name: String
    let symbol: String
    let focus: String
    let description: String
    let highlights: [String]
    var founded: String = ""
    var whereItWorks: String = ""
    var places: [MapPlace] = []
    var whoItHelps: String = ""
    var figures: [KeyFigure] = []
    var responses: [String] = []      // crises and situations it has helped in
    var source: String = ""
}

struct KeyFigure: Identifiable, Hashable {
    var id: String { label }
    let value: String
    let label: String
}

struct ImpactMetric: Identifiable, Codable, Hashable {
    var id: String { label }
    let value: Double
    let prefix: String
    let suffix: String
    let label: String
    let symbol: String
    let source: String      // shown in small print so figures stay checkable
}

// MARK: - Jeopardy

struct JeopardyCategory: Identifiable, Codable, Hashable {
    var id: String { title }
    let title: String
    let symbol: String
    let clues: [JeopardyClue]   // ordered by value, 100…500
}

struct JeopardyClue: Identifiable, Codable, Hashable {
    var id: String { question }
    let value: Int
    let question: String
    let options: [String]
    let correctIndex: Int
    let explanation: String
}

// MARK: - Explore

struct QAItem: Identifiable, Codable, Hashable {
    var id: String { question }
    let question: String
    let category: String
    let tags: [String]          // extra search keywords
    let answer: [String]        // paragraphs
    var furtherReading: String? = nil
}

// MARK: - Daily Path

struct DailyReading: Identifiable, Codable, Hashable {
    var id: Int { day }
    let day: Int
    let title: String
    let symbol: String
    let paragraphs: [String]
    let reflection: String

    var week: Int { (day - 1) / 7 + 1 }
}

// MARK: - Games

struct TrueFalseStatement: Identifiable, Codable, Hashable {
    var id: String { statement }
    let statement: String
    let isTrue: Bool
    let explanation: String
}

// MARK: - Journey (history & migration)

enum JourneyKind: String, Codable, CaseIterable {
    case origin = "Origins"
    case concealment = "In hiding"
    case empire = "Empire"
    case migration = "Migration"
    case hardship = "Hardship"
    case today = "Today"

    var symbol: String {
        switch self {
        case .origin: return "sunrise.fill"
        case .concealment: return "eye.slash.fill"
        case .empire: return "crown.fill"
        case .migration: return "figure.walk.motion"
        case .hardship: return "exclamationmark.triangle.fill"
        case .today: return "globe"
        }
    }
}

struct JourneyEvent: Identifiable, Codable, Hashable {
    var id: Int { order }
    let order: Int
    let years: String
    let title: String
    let place: String
    let latitude: Double
    let longitude: Double
    let kind: JourneyKind
    let ruledBy: String          // empire or power of the time
    let summary: String
    var hardship: String? = nil  // what the community suffered, if anything
}

// MARK: - Places on maps

struct MapPlace: Identifiable, Hashable {
    var id: String { name }
    let name: String
    let latitude: Double
    let longitude: Double
}

// MARK: - Contributions

struct ContributionArea: Identifiable, Hashable {
    var id: String { title }
    let title: String
    let symbol: String
    let items: [Contribution]
}

struct Contribution: Identifiable, Hashable {
    var id: String { title }
    let title: String
    let era: String
    let text: String
}

// MARK: - Faith & Science

enum ScienceField: String, CaseIterable, Identifiable {
    case maths = "Maths", astronomy = "Astronomy", medicine = "Medicine", physics = "Physics & optics",
         engineering = "Engineering", geography = "Geography", learning = "Learning"
    var id: String { rawValue }
    var symbol: String {
        switch self {
        case .maths: return "function"
        case .astronomy: return "moon.stars.fill"
        case .medicine: return "cross.case.fill"
        case .physics: return "eye.fill"
        case .engineering: return "gearshape.2.fill"
        case .geography: return "map.fill"
        case .learning: return "building.columns.fill"
        }
    }
}

struct Discovery: Identifiable, Hashable {
    var id: String { title }
    let title: String
    let person: String
    let when: String
    let place: String
    let field: ScienceField
    let text: String
    var lastingImpact: String? = nil
    var ismailiLink: String? = nil   // connection to Fatimid / Nizari / Ismaili history
}

struct InspiringVerse: Identifiable, Hashable {
    var id: String { reference }
    let reference: String
    let text: String        // short English rendering
    let note: String
}

struct DebatedClaim: Identifiable, Hashable {
    var id: String { reference }
    let reference: String
    let topic: String
    let verse: String
    let supporters: String
    let critics: String
}
