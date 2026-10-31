import SwiftUI

struct CompareView: View {
    enum Mode: String, CaseIterable { case religions = "Other religions", muslims = "Within Islam" }
    let query: String
    @State private var mode: Mode = LaunchScreen.is(.groups) ? .muslims : .religions

    private var religions: [ReligionProfile] {
        let q = query.trimmingCharacters(in: .whitespaces).lowercased()
        guard !q.isEmpty else { return CompareData.religions }
        return CompareData.religions.filter { r in
            ([r.name, r.god, r.keyFigures, r.scriptures, r.afterlife, r.practices] + r.similarities + r.differences)
                .joined(separator: " ").lowercased().contains(q)
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Picker("Compare", selection: $mode) {
                ForEach(Mode.allCases, id: \.self) { Text($0.rawValue).tag($0) }
            }
            .pickerStyle(.segmented)
            .onChange(of: mode) { _ in Haptics.tap() }

            if mode == .religions {
                Text("How Islam's beliefs compare with other faiths and worldviews — what we share, and where we differ. Each is described as its own followers would recognise it.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                ReligionCard(profile: CompareData.islam, isIslam: true)
                ForEach(religions) { ReligionCard(profile: $0, isIslam: false) }
                sharedValues
                Text("Follower figures: Pew Research Center 2020 estimates, unless noted.")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                SourcesList(sources: Sources.compare)
            } else {
                Text("Muslims share the Qur'an, the Prophet and belief in one God. They differ mainly on who should lead and interpret the faith after the Prophet.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                ForEach(CompareData.groups) { GroupCard(group: $0) }
            }
        }
    }

    private var sharedValues: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("What we share", systemImage: "heart.circle.fill")
                .font(.headline)
                .foregroundStyle(Color.gold)
            ForEach(CompareData.sharedValues, id: \.self) { line in
                Text(line)
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gold.opacity(0.12), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}

struct ReligionCard: View {
    let profile: ReligionProfile
    let isIslam: Bool
    @State private var open = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button {
                Haptics.tap()
                withAnimation(.spring(response: 0.4, dampingFraction: 0.85)) { open.toggle() }
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: profile.symbol)
                        .font(.headline)
                        .foregroundStyle(isIslam ? Color.emeraldDeep : .white)
                        .frame(width: 42, height: 42)
                        .background(isIslam ? AnyShapeStyle(LinearGradient.goldShine) : AnyShapeStyle(LinearGradient.brand),
                                    in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                    VStack(alignment: .leading, spacing: 2) {
                        Text(isIslam ? "Islam — for reference" : profile.name)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Text(profile.followers)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundStyle(Color.emerald)
                        .rotationEffect(.degrees(open ? 180 : 0))
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)

            if open {
                VStack(alignment: .leading, spacing: 10) {
                    InfoRow(symbol: "calendar", title: "Origins", text: profile.origin)
                    InfoRow(symbol: "sparkles", title: "God / ultimate reality", text: profile.god)
                    InfoRow(symbol: "person.2.fill", title: "Key figures", text: profile.keyFigures)
                    InfoRow(symbol: "book.closed.fill", title: "Scriptures", text: profile.scriptures)
                    InfoRow(symbol: "moon.stars", title: "After death", text: profile.afterlife)
                    InfoRow(symbol: "hands.sparkles", title: "Practices", text: profile.practices)
                }
                .transition(.opacity)

                if !profile.similarities.isEmpty {
                    list("Similar to Islam", items: profile.similarities, symbol: "equal.circle.fill", color: .emerald)
                }
                if !profile.differences.isEmpty {
                    list("Different from Islam", items: profile.differences, symbol: "arrow.left.arrow.right.circle.fill", color: .orange)
                }
                if let note = profile.ismailiNote {
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "star.fill").foregroundStyle(Color.gold)
                        Text(note)
                            .font(.subheadline)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gold.opacity(0.12), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
            }
        }
        .card()
    }

    private func list(_ title: String, items: [String], symbol: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Label(title, systemImage: symbol)
                .font(.subheadline.bold())
                .foregroundStyle(color)
            ForEach(items, id: \.self) { item in
                HStack(alignment: .top, spacing: 8) {
                    Circle().fill(color.opacity(0.7)).frame(width: 6, height: 6).padding(.top, 6)
                    Text(item)
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color.opacity(0.08), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        .transition(.opacity)
    }
}

struct GroupCard: View {
    let group: MuslimGroup

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(group.name)
                .font(.headline)
            Text(group.share)
                .font(.caption.weight(.semibold))
                .foregroundStyle(Color.emerald)
            InfoRow(symbol: "crown.fill", title: "Leadership", text: group.leadership)
            InfoRow(symbol: "mappin.and.ellipse", title: "Where", text: group.whereFound)
            ForEach(group.features, id: \.self) { feature in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "checkmark.circle.fill").foregroundStyle(Color.emerald).font(.caption)
                        .padding(.top, 2)
                    Text(feature)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .card()
    }
}
