import SwiftUI

struct WelcomeView: View {
    let onContinue: () -> Void

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            Image(systemName: "square.stack.3d.up")
                .font(.system(size: 72))
                .foregroundStyle(.blue)

            VStack(spacing: 8) {
                Text("Coordinator Demo")
                    .font(.largeTitle.bold())
                Text("Navigation architecture for modular SwiftUI apps")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            Button {
                onContinue()
            } label: {
                Text("Get Started")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.horizontal, 32)
            .padding(.bottom, 48)
        }
    }
}
