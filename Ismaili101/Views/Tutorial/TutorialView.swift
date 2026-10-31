import SwiftUI

/// First-launch interactive tour. Each page explains one part of the app
/// and includes a small "try it" demo. Can be replayed from About & Sources.
struct TutorialView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var progress: ProgressStore
    @State private var page = 0

    private let pageCount = 8

    var body: some View {
        ZStack {
            AmbientBackground()
            VStack(spacing: 0) {
                HStack {
                    Text("\(page + 1) of \(pageCount)")
                        .font(.caption.weight(.semibold).monospacedDigit())
                        .foregroundStyle(.secondary)
                    Spacer()
                    if page < pageCount - 1 {
                        Button("Skip") { finish() }
                            .font(.subheadline.weight(.semibold))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)

                TabView(selection: $page) {
                    WelcomePage().tag(0)
                    LearnPage().tag(1)
                    QuizPage().tag(2)
                    HistoryPage().tag(3)
                    ImpactPage().tag(4)
                    PlayPage().tag(5)
                    ExplorePage().tag(6)
                    FinishPage(finish: finish).tag(7)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.spring(), value: page)
                .onChange(of: page) { _ in Haptics.tap() }

                // Progress dots + next button
                HStack {
                    HStack(spacing: 6) {
                        ForEach(0..<pageCount, id: \.self) { index in
                            Capsule()
                                .fill(index == page ? Color.emerald : Color.secondary.opacity(0.3))
                                .frame(width: index == page ? 22 : 7, height: 7)
                        }
                    }
                    .animation(.spring(), value: page)
                    .accessibilityHidden(true)
                    Spacer()
                    if page < pageCount - 1 {
                        Button {
                            withAnimation(.spring()) { page += 1 }
                        } label: {
                            HStack(spacing: 6) {
                                Text(page == 0 ? "Start tour" : "Next")
                                Image(systemName: "arrow.right")
                            }
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 22)
                            .padding(.vertical, 14)
                            .background(LinearGradient.brand, in: Capsule())
                        }
                        .buttonStyle(SpringButtonStyle())
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .frame(height: 76)
            }
        }
        .onAppear {
            if LaunchScreen.current == .tutorial2 { page = 2 }
        }
    }

    private func finish() {
        Haptics.success()
        UserDefaults.standard.set(true, forKey: TutorialView.seenKey)
        dismiss()
    }

    static let seenKey = "hasSeenTutorial"
    static var hasSeen: Bool { UserDefaults.standard.bool(forKey: seenKey) }
}

// MARK: - Page scaffold

private struct TutorialPage<Demo: View>: View {
    let symbol: String
    let tab: AppTab?
    let title: String
    let text: String
    let tip: String
    @ViewBuilder let demo: Demo

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(systemName: symbol)
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(width: 64, height: 64)
                    .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .padding(.top, 8)
                Text(title)
                    .font(.largeTitle.bold())
                    .fixedSize(horizontal: false, vertical: true)
                Text(text)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)

                VStack(alignment: .leading, spacing: 10) {
                    Label("Try it", systemImage: "hand.tap.fill")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(Color.gold)
                    demo
                }

                Label(tip, systemImage: "lightbulb.fill")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)

                if let tab { MiniTabBar(highlight: tab) }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 12)
        }
    }
}

/// A small picture of the tab bar with one tab highlighted, so people learn where things live.
private struct MiniTabBar: View {
    let highlight: AppTab
    private let tabs: [(AppTab, String, String)] = [
        (.learn, "Learn", "book.fill"), (.history, "History", "crown.fill"),
        (.impact, "Impact", "globe.americas.fill"), (.play, "Play", "gamecontroller.fill"),
        (.explore, "Explore", "magnifyingglass")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Find it in the tab bar")
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
            HStack {
                ForEach(tabs, id: \.1) { tab, name, symbol in
                    let on = tab == highlight
                    VStack(spacing: 3) {
                        Image(systemName: symbol).font(.system(size: 18))
                        Text(name).font(.system(size: 10, weight: .medium))
                    }
                    .foregroundStyle(on ? Color.emerald : Color.secondary.opacity(0.6))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(on ? Color.emerald.opacity(0.12) : .clear, in: RoundedRectangle(cornerRadius: 10))
                    .scaleEffect(on ? 1.08 : 1)
                }
            }
            .padding(6)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Found in the \(tabs.first { $0.0 == highlight }?.1 ?? "") tab")
    }
}

// MARK: - Pages

private struct WelcomePage: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                Image("AppIconImage")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
                    .shadow(color: .black.opacity(0.15), radius: 14, y: 6)
                    .padding(.top, 40)
                    .accessibilityHidden(true)
                Text("Welcome to Ismaili 101")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                Text("Explore the history, thought, practice and institutions of the Shia Imami Ismaili Muslims — a few minutes a day.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                VStack(alignment: .leading, spacing: 12) {
                    point("calendar", "A 3-minute reading every day")
                    point("book.fill", "16 chapters with lessons and quizzes")
                    point("gamecontroller.fill", "Games to test what you've learned")
                    point("magnifyingglass", "Answers to big questions")
                }
                .card()
                Text("This quick tour takes about a minute.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 24)
        }
    }

    private func point(_ symbol: String, _ text: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: symbol)
                .foregroundStyle(Color.emerald)
                .frame(width: 24)
            Text(text).font(.subheadline.weight(.medium))
        }
    }
}

private struct LearnPage: View {
    var body: some View {
        TutorialPage(symbol: "book.fill", tab: .learn,
                     title: "Learn a little each day",
                     text: "Start with Today's reading at the top of the Learn tab — it takes about three minutes, and a new one unlocks each morning. Below it are 16 chapters, each with an overview, deeper lessons and key terms.",
                     tip: "Key terms are flip cards. Tap one to reveal its meaning.") {
            KeyTermCard(term: KeyTerm(term: "Ta'wil", definition: "Leading an outward form back to its inner meaning."))
            KeyTermCard(term: KeyTerm(term: "Khidmat", definition: "Voluntary service offered for the good of others."))
        }
    }
}

private struct QuizPage: View {
    @State private var chosen: Int?
    private let question = QuizQuestion(prompt: "What does 'Hazar Imam' mean?",
                                        options: ["Present Imam", "First Imam", "Hidden Imam"],
                                        correctIndex: 0,
                                        explanation: "Hazar Imam means the present, living Imam.")

    var body: some View {
        TutorialPage(symbol: "checkmark.circle.fill", tab: .learn,
                     title: "Check what you know",
                     text: "Every chapter ends with a knowledge check: 25 questions, served five at a time. Questions you get right count as 'mastered', and new ones come first next round.",
                     tip: "Answer a question to see why it's right — every answer comes with an explanation.") {
            VStack(alignment: .leading, spacing: 10) {
                Text(question.prompt).font(.headline)
                ForEach(Array(question.options.enumerated()), id: \.offset) { index, option in
                    OptionButton(text: option, state: status(index)) {
                        withAnimation(.spring()) { chosen = index }
                        index == question.correctIndex ? Haptics.success() : Haptics.error()
                    }
                }
                if chosen != nil {
                    Label(question.explanation, systemImage: "info.circle.fill")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .transition(.opacity)
                }
            }
            .card()
        }
    }

    private func status(_ index: Int) -> OptionButton.Status {
        guard let chosen else { return .idle }
        if index == question.correctIndex { return .correct }
        return index == chosen ? .wrong : .dimmed
    }
}

private struct HistoryPage: View {
    @State private var part = 0
    private let parts = [
        ("Imams", "crown.fill", "Timeline cards for key Imams — tap 'Cool fact & history' for the empire, where they lived, world events and famous people of the time. There's also a list of all 50."),
        ("Journey", "map.fill", "A map and timeline of where the community lived, under which powers, when it went into hiding, and what it endured."),
        ("People", "person.2.fill", "Da'is, pirs and women who shaped Ismaili history.")
    ]

    var body: some View {
        TutorialPage(symbol: "crown.fill", tab: .history,
                     title: "Walk through history",
                     text: "The History tab tells the story of the Imams and the community across 1,400 years.",
                     tip: "Use the switch at the top of the History tab to move between its three sections.") {
            VStack(alignment: .leading, spacing: 12) {
                Picker("Section", selection: $part) {
                    ForEach(parts.indices, id: \.self) { Text(parts[$0].0).tag($0) }
                }
                .pickerStyle(.segmented)
                .onChange(of: part) { _ in Haptics.tap() }
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: parts[part].1)
                        .font(.title2)
                        .foregroundStyle(Color.emerald)
                        .frame(width: 30)
                    Text(parts[part].2)
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .id(part)
                .transition(.opacity)
            }
            .card()
            .animation(.spring(), value: part)
        }
    }
}

private struct ImpactPage: View {
    var body: some View {
        TutorialPage(symbol: "globe.americas.fill", tab: .impact,
                     title: "See faith in action",
                     text: "The Impact tab shows the work of the Aga Khan Development Network — hospitals, schools, disaster relief, culture — and how Ismailis have contributed to the world.",
                     tip: "Tap any agency to see where it works on a map, who it helps, and the numbers behind it.") {
            HStack(spacing: 12) {
                MetricTile(metric: ImpactMetric(value: 30, prefix: "", suffix: "+", label: "Countries",
                                                symbol: "globe.europe.africa.fill", source: ""), delay: 0.1)
                MetricTile(metric: ImpactMetric(value: 96, prefix: "", suffix: "K", label: "Employees",
                                                symbol: "person.2.fill", source: ""), delay: 0.25)
            }
        }
    }
}

private struct PlayPage: View {
    @State private var selected: Game = .jeopardy

    var body: some View {
        TutorialPage(symbol: "gamecontroller.fill", tab: .play,
                     title: "Play to remember",
                     text: "Four games turn what you've learned into a challenge, and each keeps your best score.",
                     tip: "Tap a game below to see how it works.") {
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 10) {
                    ForEach(Game.allCases) { game in
                        Button {
                            Haptics.tap()
                            withAnimation(.spring()) { selected = game }
                        } label: {
                            Image(systemName: game.symbol)
                                .font(.title3)
                                .foregroundStyle(selected == game ? .white : Color.emerald)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(selected == game ? AnyShapeStyle(LinearGradient.brand)
                                                             : AnyShapeStyle(Color.emerald.opacity(0.12)),
                                            in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                        }
                        .buttonStyle(SpringButtonStyle())
                        .accessibilityLabel(game.title)
                    }
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(selected.title).font(.headline)
                    Text(selected.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .id(selected)
                .transition(.opacity)
            }
            .card()
        }
    }
}

private struct ExplorePage: View {
    @State private var openIndex: Int?
    private let samples = [
        ("Who is the present Imam?", "His Highness Prince Rahim Aga Khan V, the 50th Imam, since 4 February 2025."),
        ("Do Ismailis accept evolution?", "Faith and science are seen as complementary; many Ismailis see no conflict with evolution."),
        ("What happens when we die?", "The soul continues its journey, carrying the knowledge and good it has gathered.")
    ]

    var body: some View {
        TutorialPage(symbol: "magnifyingglass", tab: .explore,
                     title: "Ask big questions",
                     text: "Explore has answers to common questions — search any word, or tap a topic chip. The Compare section shows how Islam relates to other religions, and how Muslim groups differ.",
                     tip: "Search also finds matching chapters, lessons and daily readings.") {
            VStack(spacing: 10) {
                ForEach(samples.indices, id: \.self) { index in
                    Button {
                        Haptics.tap()
                        withAnimation(.spring()) { openIndex = openIndex == index ? nil : index }
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(samples[index].0)
                                    .font(.subheadline.weight(.semibold))
                                    .foregroundStyle(.primary)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(Color.emerald)
                                    .rotationEffect(.degrees(openIndex == index ? 180 : 0))
                            }
                            if openIndex == index {
                                Text(samples[index].1)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .padding(12)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

private struct FinishPage: View {
    @EnvironmentObject private var progress: ProgressStore
    let finish: () -> Void

    var body: some View {
        TutorialPage(symbol: "flame.fill", tab: nil,
                     title: "Make it a habit",
                     text: "Learn something each day to build a streak. You can turn on a gentle daily reminder for your reading, and change it any time.",
                     tip: "Tap ⓘ at the top of the Learn tab for sources, settings and to replay this tour.") {
            VStack(alignment: .leading, spacing: 14) {
                Toggle(isOn: Binding(get: { progress.reminderEnabled },
                                     set: { progress.setReminder(enabled: $0) })) {
                    Label("Daily reminder", systemImage: "bell.fill")
                        .font(.subheadline.weight(.semibold))
                }
                .tint(Color.emerald)
                Text("You can choose the time later in About & Sources.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .card()

            Button(action: finish) {
                Text("Start learning")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .buttonStyle(SpringButtonStyle())
            .padding(.top, 4)
        }
    }
}
