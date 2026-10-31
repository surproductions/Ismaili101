import SwiftUI

final class MatchGameViewModel: ObservableObject {
    static let pairCount = 5

    @Published private(set) var terms: [KeyTerm] = []
    @Published private(set) var definitions: [KeyTerm] = []   // same items, shuffled order
    @Published private(set) var matched: Set<String> = []
    @Published var selectedTerm: String?
    @Published private(set) var wrongDefinition: String?
    @Published private(set) var mistakes = 0

    private let pool: [KeyTerm]

    init(pool: [KeyTerm] = ChaptersData.all.flatMap(\.keyTerms)) {
        var seen = Set<String>()
        self.pool = pool.filter { seen.insert($0.term).inserted }   // unique terms only
        newGame()
    }

    var isFinished: Bool { !terms.isEmpty && matched.count == terms.count }
    var score: Int { max(0, matched.count * 100 - mistakes * 25) }

    func newGame() {
        let picked = Array(pool.shuffled().prefix(Self.pairCount))
        withAnimation(.spring()) {
            terms = picked
            definitions = picked.shuffled()
            matched = []
            selectedTerm = nil
            wrongDefinition = nil
            mistakes = 0
        }
    }

    func select(term: KeyTerm) {
        guard !matched.contains(term.id) else { return }
        Haptics.tap()
        withAnimation(.spring()) { selectedTerm = term.id }
    }

    func select(definition: KeyTerm) {
        guard let selected = selectedTerm, !matched.contains(definition.id) else { return }
        if selected == definition.id {
            Haptics.success()
            withAnimation(.spring()) {
                matched.insert(definition.id)
                selectedTerm = nil
            }
        } else {
            Haptics.error()
            mistakes += 1
            withAnimation(.spring()) { wrongDefinition = definition.id }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self] in
                withAnimation(.spring()) { self?.wrongDefinition = nil }
            }
        }
    }
}

struct MatchGameView: View {
    @StateObject private var vm = MatchGameViewModel()
    @EnvironmentObject private var progress: ProgressStore

    var body: some View {
        ZStack {
            AmbientBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Tap a term, then its meaning.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Spacer()
                        PillTag(text: "Mistakes: \(vm.mistakes)", color: vm.mistakes == 0 ? .emerald : .orange)
                    }

                    // Terms as chips
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 8)], spacing: 8) {
                        ForEach(vm.terms) { term in
                            let isMatched = vm.matched.contains(term.id)
                            let isSelected = vm.selectedTerm == term.id
                            Button { vm.select(term: term) } label: {
                                Text(term.term)
                                    .font(.subheadline.weight(.semibold))
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.8)
                                    .frame(maxWidth: .infinity, minHeight: 44)
                                    .padding(.horizontal, 8)
                                    .foregroundStyle(isSelected ? Color.white : Color.primary)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                                            .fill(isSelected ? AnyShapeStyle(LinearGradient.brand)
                                                  : AnyShapeStyle(isMatched ? Color.emerald.opacity(0.15) : Color(UIColor.secondarySystemFill)))
                                    )
                                    .overlay(alignment: .topTrailing) {
                                        if isMatched {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundStyle(Color.emerald)
                                                .padding(4)
                                        }
                                    }
                            }
                            .buttonStyle(SpringButtonStyle())
                            .disabled(isMatched)
                            .opacity(isMatched ? 0.6 : 1)
                        }
                    }

                    Text("Meanings")
                        .font(.headline)
                        .foregroundStyle(Color.emerald)

                    ForEach(vm.definitions) { item in
                        let isMatched = vm.matched.contains(item.id)
                        let isWrong = vm.wrongDefinition == item.id
                        Button { vm.select(definition: item) } label: {
                            HStack(alignment: .top) {
                                Text(item.definition)
                                    .font(.subheadline)
                                    .foregroundStyle(.primary)
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer(minLength: 8)
                                if isMatched {
                                    Text(item.term)
                                        .font(.caption.weight(.bold))
                                        .foregroundStyle(Color.emerald)
                                }
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .fill(isWrong ? Color.red.opacity(0.18)
                                          : (isMatched ? Color.emerald.opacity(0.12) : Color(UIColor.secondarySystemFill)))
                            )
                            .offset(x: isWrong ? 6 : 0)
                        }
                        .buttonStyle(SpringButtonStyle())
                        .disabled(isMatched || vm.selectedTerm == nil)
                    }

                    if vm.isFinished {
                        GameOverPanel(title: "All matched!",
                                      detail: "Score \(vm.score) · \(vm.mistakes) mistake\(vm.mistakes == 1 ? "" : "s")") {
                            vm.newGame()
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Match Up")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button { vm.newGame() } label: { Label("New game", systemImage: "arrow.counterclockwise") }
            }
        }
        .onChange(of: vm.isFinished) { done in
            if done { progress.record(vm.score, for: Game.match.rawValue) }
        }
    }
}
