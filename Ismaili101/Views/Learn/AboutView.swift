import SwiftUI

/// About the app, reminder settings, and every source used.
struct AboutView: View {
    @EnvironmentObject private var progress: ProgressStore
    @State private var reminderTime = Date()
    @State private var showTour = false

    var body: some View {
        ZStack {
            AmbientBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 10) {
                        Image("AppIconImage")
                            .resizable()
                            .frame(width: 64, height: 64)
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                            .accessibilityHidden(true)
                        Text("Ismaili 101")
                            .font(.title.bold())
                        Text("An introduction to the history, thought, practice and institutions of the Shia Imami Ismaili Muslims.")
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .card()

                    Button {
                        Haptics.tap()
                        showTour = true
                    } label: {
                        LinkCard(title: "Take the tour", subtitle: "A one-minute guide to everything in the app",
                                 symbol: "sparkles", gold: true)
                    }
                    .buttonStyle(SpringButtonStyle())

                    VStack(alignment: .leading, spacing: 8) {
                        Label("About this app", systemImage: "info.circle.fill")
                            .font(.headline)
                            .foregroundStyle(Color.emerald)
                        Text("Ismaili 101 is an independent educational project. It is not an official publication of the Ismaili Imamat or its institutions, and it does not speak for the Imam of the Time.")
                            .font(.subheadline)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("Content is introductory and has been drawn from published scholarship and public sources, listed below. For authoritative guidance, please consult your local Ismaili Tariqah and Religious Education Board (ITREB).")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .card()

                    VStack(alignment: .leading, spacing: 12) {
                        Label("Daily reminder", systemImage: "bell.fill")
                            .font(.headline)
                            .foregroundStyle(Color.emerald)
                        Toggle(isOn: Binding(get: { progress.reminderEnabled },
                                             set: { progress.setReminder(enabled: $0) })) {
                            Text("Remind me to read the Daily Path")
                                .font(.subheadline)
                        }
                        .tint(Color.emerald)
                        if progress.reminderEnabled {
                            DatePicker("Time", selection: $reminderTime, displayedComponents: .hourAndMinute)
                                .font(.subheadline)
                                .onChange(of: reminderTime) { progress.setReminderTime($0) }
                        }
                        HStack(spacing: 6) {
                            Image(systemName: "flame.fill").foregroundStyle(.orange)
                            Text(progress.streak == 1 ? "1-day learning streak" : "\(progress.streak)-day learning streak")
                                .font(.subheadline.weight(.semibold))
                        }
                    }
                    .card()

                    SectionHeader(title: "All sources", symbol: "text.book.closed.fill")
                    Text("Tap any source to open it.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(Sources.all) { source in
                            if let url = URL(string: source.url) {
                                Link(destination: url) {
                                    HStack(alignment: .top, spacing: 8) {
                                        Image(systemName: "arrow.up.right.square").font(.caption).padding(.top, 2)
                                        Text(source.title)
                                            .font(.footnote)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                }
                            }
                        }
                    }
                    .card()
                }
                .padding()
            }
        }
        .navigationTitle("About & Sources")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { reminderTime = progress.reminderDate }
        .fullScreenCover(isPresented: $showTour) { TutorialView().environmentObject(progress) }
    }
}
