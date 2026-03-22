import SwiftUI

struct AccountView: View {
    let onOpenSettings: () -> Void
    let onSecuritySettings: () -> Void
    let onLogout: () -> Void

    var body: some View {
        List {
            Section("Account") {
                Button("Security Settings", systemImage: "lock.shield") {
                    onSecuritySettings()
                }
                .tint(.primary)
            }

            Section {
                Button("Log Out", role: .destructive) {
                    onLogout()
                }
            }
        }
        .navigationTitle("Account")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    onOpenSettings()
                } label: {
                    Image(systemName: "gearshape")
                }
            }
        }
    }
}
