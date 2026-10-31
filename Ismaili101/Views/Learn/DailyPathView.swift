import SwiftUI

/// Card at the top of the Learn tab pointing to today's reading.
struct TodayCard: View {
    @EnvironmentObject private var progress: ProgressStore

    private var today: DailyReading {
        let day = min(progress.unlockedDay, DailyData.all.count)
        return DailyData.all[day - 1]
    }

    var body: some View {
        NavigationLink(value: LearnRoute.daily(today.day)) {
            HStack(spacing: 14) {
                Image(systemName: today.symbol)
                    .font(.title2)
                    .foregroundStyle(Color.emeraldDeep)
                    .frame(width: 52, height: 52)
                    .background(LinearGradient.goldShine, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                VStack(alignment: .leading, spacing: 3) {
                    Text("Today · Day \(today.day) of \(DailyData.all.count)")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.white.opacity(0.85))
                    Text(today.title)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(progress.readDays.contains(today.day) ? "Read ✓ — see the full path" : "3-minute reading")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))
                }
                Spacer()
                Image(systemName: "chevron.right").foregroundStyle(.white.opacity(0.8))
            }
            .padding()
            .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .buttonStyle(SpringButtonStyle())
    }
}

struct DailyPathView: View {
    @EnvironmentObject private var progress: ProgressStore

    var body: some View {
        ZStack {
            AmbientBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("One short reading a day for four weeks. A new day unlocks each morning.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    ForEach(1...4, id: \.self) { week in
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Week \(week) · \(DailyData.weekTitles[week] ?? "")")
                                .font(.title3.bold())
                                .foregroundStyle(Color.emerald)
                            ForEach(DailyData.all.filter { $0.week == week }) { reading in
                                row(reading)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Daily Path")
    }

    @ViewBuilder
    private func row(_ reading: DailyReading) -> some View {
        let locked = reading.day > progress.unlockedDay
        let done = progress.readDays.contains(reading.day)
        let content = HStack(spacing: 12) {
            Text("\(reading.day)")
                .font(.subheadline.bold().monospacedDigit())
                .foregroundStyle(done ? Color.emeraldDeep : .white)
                .frame(width: 34, height: 34)
                .background(Circle().fill(done ? AnyShapeStyle(LinearGradient.goldShine) : AnyShapeStyle(LinearGradient.brand)))
            Text(reading.title)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(locked ? .secondary : .primary)
            Spacer()
            Image(systemName: locked ? "lock.fill" : (done ? "checkmark.circle.fill" : "chevron.right"))
                .foregroundStyle(done ? Color.gold : .secondary)
        }
        .card(cornerRadius: 16)
        .opacity(locked ? 0.55 : 1)

        if locked {
            content
        } else {
            NavigationLink(value: LearnRoute.daily(reading.day)) { content }
                .buttonStyle(SpringButtonStyle())
        }
    }
}

struct DailyReadingView: View {
    let reading: DailyReading
    @EnvironmentObject private var progress: ProgressStore

    var body: some View {
        let done = progress.readDays.contains(reading.day)
        ZStack {
            AmbientBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Image(systemName: reading.symbol)
                            .font(.system(size: 32))
                            .foregroundStyle(Color.gold)
                        Text("Day \(reading.day) · Week \(reading.week): \(DailyData.weekTitles[reading.week] ?? "")")
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.white.opacity(0.85))
                        Text(reading.title)
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(22)
                    .background(LinearGradient.brand, in: RoundedRectangle(cornerRadius: 26, style: .continuous))

                    VStack(alignment: .leading, spacing: 14) {
                        ForEach(reading.paragraphs, id: \.self) { paragraph in
                            Text(paragraph)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineSpacing(4)
                        }
                    }
                    .card()

                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "sparkles").foregroundStyle(Color.gold)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Reflect")
                                .font(.caption.weight(.bold))
                                .foregroundStyle(Color.gold)
                            Text(reading.reflection)
                                .font(.body.italic())
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gold.opacity(0.12), in: RoundedRectangle(cornerRadius: 16, style: .continuous))

                    Button {
                        Haptics.success()
                        withAnimation(.spring()) { progress.markRead(day: reading.day) }
                    } label: {
                        Label(done ? "Completed" : "Mark as read",
                              systemImage: done ? "checkmark.seal.fill" : "checkmark")
                            .font(.headline)
                            .foregroundStyle(done ? Color.emeraldDeep : .white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(done ? AnyShapeStyle(LinearGradient.goldShine) : AnyShapeStyle(LinearGradient.brand),
                                        in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    }
                    .buttonStyle(SpringButtonStyle())
                    .disabled(done)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
