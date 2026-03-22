import SwiftUI

struct ConfirmLogoutView: View {
    let onConfirm: () -> Void
    let onCancel: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "rectangle.portrait.and.arrow.right")
                .font(.system(size: 48))
                .foregroundStyle(.red)

            Text("Are you sure you want to log out?")
                .font(.headline)

            HStack(spacing: 16) {
                Button("Cancel") { onCancel() }
                    .buttonStyle(.bordered)

                Button("Log Out") { onConfirm() }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
            }
        }
        .padding()
        .presentationDetents([.height(250)])
    }
}
