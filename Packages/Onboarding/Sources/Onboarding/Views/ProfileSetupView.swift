import SwiftUI

struct ProfileSetupView: View {
    let onComplete: () -> Void
    @State private var displayName = ""
    @State private var bio = ""

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: "person.crop.circle.badge.plus")
                .font(.system(size: 64))
                .foregroundStyle(.blue)

            VStack(spacing: 16) {
                TextField("Display Name", text: $displayName)
                    .textFieldStyle(.roundedBorder)

                TextField("Short Bio", text: $bio)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal, 32)

            Button {
                onComplete()
            } label: {
                Text("Continue")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.horizontal, 32)

            Spacer()
        }
        .navigationTitle("Set Up Profile")
    }
}
