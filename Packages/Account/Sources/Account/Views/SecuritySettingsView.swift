import SwiftUI

struct SecuritySettingsView: View {
    var body: some View {
        List {
            Section("Authentication") {
                Toggle("Face ID", isOn: .constant(true))
                Toggle("Biometric Payments", isOn: .constant(false))
            }
            Section("Privacy") {
                Toggle("Hide Balance", isOn: .constant(false))
            }
        }
        .navigationTitle("Security")
    }
}
