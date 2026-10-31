import SwiftUI
import UIKit

// MARK: - Colors

extension Color {
    /// Deep emerald (#0F5132) — primary brand colour.
    static let emeraldDeep = Color(hex: 0x0F5132)
    /// Brighter emerald (#198754) — accent / interactive colour.
    static let emerald = Color(hex: 0x198754)
    /// Warm gold (#D4AF37) — highlights and achievements.
    static let gold = Color(hex: 0xD4AF37)
    /// Amber gold (#FFC107) — secondary highlight.
    static let amber = Color(hex: 0xFFC107)

    init(hex: UInt32, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: opacity
        )
    }
}

extension LinearGradient {
    static let brand = LinearGradient(
        colors: [.emeraldDeep, .emerald],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let goldShine = LinearGradient(
        colors: [.gold, .amber],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

// MARK: - Haptics

enum Haptics {
    static func tap(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .light) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }

    static func success() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }

    static func error() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
}

// MARK: - Reusable styling

struct CardBackground: ViewModifier {
    var cornerRadius: CGFloat = 20

    func body(content: Content) -> some View {
        content
            .padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(Color.primary.opacity(0.06))
            )
            .shadow(color: .black.opacity(0.06), radius: 10, y: 4)
    }
}

extension View {
    func card(cornerRadius: CGFloat = 20) -> some View {
        modifier(CardBackground(cornerRadius: cornerRadius))
    }
}

/// Soft ambient background used behind every tab: system background with
/// two blurred brand-colour glows ("dynamic lighting").
struct AmbientBackground: View {
    var body: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground)
            Circle()
                .fill(Color.emerald.opacity(0.18))
                .frame(width: 320)
                .blur(radius: 90)
                .offset(x: -140, y: -260)
            Circle()
                .fill(Color.gold.opacity(0.16))
                .frame(width: 280)
                .blur(radius: 90)
                .offset(x: 150, y: 300)
        }
        .ignoresSafeArea()
    }
}

/// Pressable button style with a spring scale and a light haptic.
struct SpringButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

struct PillTag: View {
    let text: String
    var color: Color = .emerald

    var body: some View {
        Text(text)
            .font(.caption.weight(.semibold))
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(color.opacity(0.15), in: Capsule())
            .foregroundStyle(color)
    }
}
