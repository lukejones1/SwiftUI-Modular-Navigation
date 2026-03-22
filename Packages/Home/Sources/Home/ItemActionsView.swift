import SwiftUI

struct ItemActionsView: View {
    private let item: ListItem
    private let onDismiss: () -> Void

    init(item: ListItem, onDismiss: @escaping () -> Void) {
        self.item = item
        self.onDismiss = onDismiss
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Actions for \(item.title)") {
                    Button("Share", systemImage: "square.and.arrow.up") {}
                    Button("Duplicate", systemImage: "doc.on.doc") {}
                    Button("Delete", systemImage: "trash", role: .destructive) {}
                }
            }
            .navigationTitle("Actions")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { onDismiss() }
                }
            }
        }
        .presentationDetents([.medium])
    }
}
