import SwiftUI

struct TermsView: View {
    let onDismiss: () -> Void

    var body: some View {
        NavigationStack {
            ScrollView {
                Text("These are the terms and conditions for the Coordinator Demo app. This is placeholder text to demonstrate modal presentation within the onboarding flow.\n\nThe important architectural point is that this sheet is managed by the OnboardingCoordinator's Router — the same pattern used in feature modules, but here the coordinator also controls the flow logic.")
                    .padding()
            }
            .navigationTitle("Terms & Conditions")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { onDismiss() }
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
}
