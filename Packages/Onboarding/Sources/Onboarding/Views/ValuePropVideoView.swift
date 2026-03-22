import SwiftUI

struct ValuePropVideoView: View {
    let onComplete: () -> Void
    let onSkip: () -> Void

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            RoundedRectangle(cornerRadius: 16)
                .fill(.black)
                .frame(height: 200)
                .overlay {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 64))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 32)

            VStack(spacing: 8) {
                Text("See What's Possible")
                    .font(.title2.bold())
                Text("Watch a quick overview of how the app works")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            VStack(spacing: 12) {
                Button {
                    onComplete()
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

                Button("Skip") {
                    onSkip()
                }
                .font(.subheadline)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 48)
        }
        .navigationTitle("Welcome")
        .navigationBarTitleDisplayMode(.inline)
    }
}
