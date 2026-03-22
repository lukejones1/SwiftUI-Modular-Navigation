import SwiftUI

struct ListView: View {
    private let items: [ListItem]
    private let onSelectItem: (ListItem) -> Void
    private let onOpenSettings: () -> Void

    init(
        items: [ListItem] = ListItem.samples(),
        onSelectItem: @escaping (ListItem) -> Void,
        onOpenSettings: @escaping () -> Void
    ) {
        self.items = items
        self.onSelectItem = onSelectItem
        self.onOpenSettings = onOpenSettings
    }

    var body: some View {
        List {
            ForEach(items) { item in
                Button {
                    onSelectItem(item)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.subtitle)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 4)
                }
                .tint(.primary)
            }
        }
        .navigationTitle("Home")
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
