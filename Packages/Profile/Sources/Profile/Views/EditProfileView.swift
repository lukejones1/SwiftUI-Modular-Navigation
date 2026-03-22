import SwiftUI

struct EditProfileView: View {
    let onDismiss: () -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("Personal") {
                    TextField("Name", text: .constant("Luke Jones"))
                    TextField("Role", text: .constant("iOS Developer"))
                }
            }
            .navigationTitle("Edit Profile")
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
