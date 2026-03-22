import SwiftUI

public struct SettingsFlowView: View {
    private let onDismiss: () -> Void

    init(onDismiss: @escaping () -> Void) {
        self.onDismiss = onDismiss
    }

    public var body: some View {
        NavigationStack {
            List {
                Section("General") {
                    Toggle("Notifications", isOn: .constant(true))
                    Toggle("Dark Mode", isOn: .constant(false))
                }

                Section("Data") {
                    Button("Clear Cache") {}
                    Button("Export Data") {}
                }

                Section("About") {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { onDismiss() }
                }
            }
        }
    }
}
