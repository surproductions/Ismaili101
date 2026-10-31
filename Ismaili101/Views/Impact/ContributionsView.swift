import SwiftUI

struct ContributionsView: View {
    @State private var openArea: String? = ContributionsData.all.first?.id

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("How the Imams, scholars, institutions and community have contributed to the world — from Fatimid Cairo to today.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            ForEach(ContributionsData.all) { area in
                VStack(alignment: .leading, spacing: 12) {
                    Button {
                        Haptics.tap()
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.85)) {
                            openArea = openArea == area.id ? nil : area.id
                        }
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: area.symbol)
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(width: 40, height: 40)
                                .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                            VStack(alignment: .leading, spacing: 2) {
                                Text(area.title)
                                    .font(.headline)
                                    .foregroundStyle(.primary)
                                Text("\(area.items.count) highlights")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundStyle(Color.emerald)
                                .rotationEffect(.degrees(openArea == area.id ? 180 : 0))
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)

                    if openArea == area.id {
                        ForEach(area.items) { item in
                            VStack(alignment: .leading, spacing: 4) {
                                HStack(alignment: .firstTextBaseline) {
                                    Text(item.title)
                                        .font(.subheadline.weight(.bold))
                                    Spacer()
                                    Text(item.era)
                                        .font(.caption.weight(.semibold))
                                        .foregroundStyle(Color.gold)
                                        .multilineTextAlignment(.trailing)
                                }
                                Text(item.text)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.emerald.opacity(0.07), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .transition(.opacity.combined(with: .move(edge: .top)))
                        }
                    }
                }
                .card()
            }
        }
    }
}
