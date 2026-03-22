import SwiftUI

struct ProfileView: View {
    let onEditProfile: () -> Void
    let onViewHistory: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.blue)

            VStack(spacing: 4) {
                Text("Luke Jones")
                    .font(.title.bold())
                Text("iOS Developer")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            VStack(spacing: 12) {
                Button("Edit Profile") { onEditProfile() }
                    .buttonStyle(.borderedProminent)

                Button("View History") { onViewHistory() }
                    .buttonStyle(.bordered)
            }
        }
        .navigationTitle("Profile")
    }
}
