import SwiftUI

struct ExploreView: View {
    enum Pane: String, CaseIterable { case questions = "Q&A", compare = "Compare" }

    @StateObject private var vm: ExploreViewModel = {
        let model = ExploreViewModel()
        if LaunchScreen.is(.search) { model.query = "soul" }
        return model
    }()
    @State private var pane: Pane = (LaunchScreen.is(.compare) || LaunchScreen.is(.groups)) ? .compare : .questions

    var body: some View {
        NavigationStack {
            ZStack {
                AmbientBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {
                        Picker("Section", selection: $pane) {
                            ForEach(Pane.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                        }
                        .pickerStyle(.segmented)
                        .onChange(of: pane) { _ in Haptics.tap() }

                        if pane == .compare {
                            CompareView(query: vm.query)
                        } else {
                            suggestionChips

                            let hits = vm.lessonHits
                            if vm.results.isEmpty && hits.isEmpty {
                                emptyState
                            } else {
                                if !vm.query.isEmpty && !vm.results.isEmpty {
                                    SectionHeader(title: "Questions & answers")
                                }
                                ForEach(vm.results) { item in
                                    QACard(item: item, isExpanded: vm.expanded.contains(item.id)) {
                                        vm.toggle(item)
                                    }
                                }
                                if !hits.isEmpty {
                                    SectionHeader(title: "In lessons & guides")
                                    ForEach(hits) { hit in
                                        NavigationLink(value: hit) {
                                            LinkCard(title: hit.title, subtitle: hit.kind, symbol: hit.symbol)
                                        }
                                        .buttonStyle(SpringButtonStyle())
                                    }
                                }
                            }
                        }

                        Text("Answers are introductory. For deeper guidance, speak with your local religious education teachers or visit iis.ac.uk.")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                            .padding(.top, 8)
                    }
                    .padding()
                    .animation(.spring(), value: vm.query)
                }
                .scrollDismissesKeyboard(.interactively)
            }
            .navigationTitle("Explore")
            .navigationDestination(for: SearchHit.self) { hit in
                switch hit {
                case .chapter(let chapter): ChapterDetailView(chapter: chapter)
                case .daily(let reading): DailyReadingView(reading: reading)
                case .guide(let page): GuideView(page: page)
                }
            }
            .searchable(text: $vm.query, placement: .navigationBarDrawer(displayMode: .always),
                        prompt: pane == .questions ? "Search questions or topics" : "Search religions")
        }
    }

    private var suggestionChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(ExploreViewModel.suggestions, id: \.self) { suggestion in
                    Button {
                        Haptics.tap()
                        vm.query = suggestion
                    } label: {
                        Text(suggestion)
                            .font(.subheadline.weight(.medium))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 7)
                            .background(.ultraThinMaterial, in: Capsule())
                            .overlay(Capsule().strokeBorder(Color.emerald.opacity(0.3)))
                    }
                    .buttonStyle(SpringButtonStyle())
                }
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 10) {
            Image(systemName: "text.magnifyingglass")
                .font(.system(size: 40))
                .foregroundStyle(Color.emerald)
            Text("No matches for “\(vm.query)”")
                .font(.headline)
            Text("Try a broader word, like “Imam”, “prayer” or “science”.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
    }
}

struct QACard: View {
    let item: QAItem
    let isExpanded: Bool
    let toggle: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button(action: toggle) {
                HStack(alignment: .top, spacing: 12) {
                    VStack(alignment: .leading, spacing: 6) {
                        PillTag(text: item.category)
                        Text(item.question)
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundStyle(Color.emerald)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .accessibilityHint(isExpanded ? "Collapse answer" : "Expand answer")

            if isExpanded {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(item.answer, id: \.self) { paragraph in
                        Text(paragraph)
                            .font(.subheadline)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    if let reading = item.furtherReading {
                        Label(reading, systemImage: "book.closed.fill")
                            .font(.footnote.weight(.semibold))
                            .foregroundStyle(Color.gold)
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .card()
    }
}
