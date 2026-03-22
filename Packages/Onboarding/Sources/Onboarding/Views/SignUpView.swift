import SwiftUI

struct SignUpView: View {
    let onComplete: () -> Void
    let onShowTerms: () -> Void
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            VStack(spacing: 16) {
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)

                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.password)
            }
            .padding(.horizontal, 32)

            Button {
                onComplete()
            } label: {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.horizontal, 32)

            Button("Terms & Conditions") {
                onShowTerms()
            }
            .font(.caption)

            Spacer()
        }
        .navigationTitle("Sign Up")
    }
}
