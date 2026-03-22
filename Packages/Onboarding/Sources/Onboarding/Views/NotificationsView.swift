import SwiftUI

struct NotificationsView: View {
    let onEnable: () -> Void
    let onSkip: () -> Void

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            Image(systemName: "bell.badge.fill")
                .font(.system(size: 72))
                .foregroundStyle(.orange)

            VStack(spacing: 8) {
                Text("Stay in the Loop")
                    .font(.title2.bold())
                Text("Get notified about updates and activity")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            VStack(spacing: 12) {
                Button {
                    onEnable()
                } label: {
                    Text("Enable Notifications")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

                Button("Not Now") {
                    onSkip()
                }
                .font(.subheadline)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 48)
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
    }
}
