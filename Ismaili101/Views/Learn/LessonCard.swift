import SwiftUI

/// Expandable "Go deeper" lesson inside a chapter.
struct LessonCard: View {
    let lesson: Lesson
    let number: Int
    @State private var isOpen = false

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Button {
                Haptics.tap()
                withAnimation(.spring(response: 0.4, dampingFraction: 0.85)) { isOpen.toggle() }
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: lesson.symbol)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 38, height: 38)
                        .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 11, style: .continuous))
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Lesson \(number)")
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(Color.emerald)
                        Text(lesson.heading)
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundStyle(Color.emerald)
                        .rotationEffect(.degrees(isOpen ? 180 : 0))
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)

            if isOpen {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(lesson.body, id: \.self) { paragraph in
                        Text(paragraph)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineSpacing(3)
                    }
                    if let reflection = lesson.reflection {
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "sparkles").foregroundStyle(Color.gold)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Reflect")
                                    .font(.caption.weight(.bold))
                                    .foregroundStyle(Color.gold)
                                Text(reflection)
                                    .font(.subheadline.italic())
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gold.opacity(0.12), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .card()
    }
}
