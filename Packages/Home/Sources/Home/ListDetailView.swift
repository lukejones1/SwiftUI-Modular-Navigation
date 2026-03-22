import SwiftUI

struct ListDetailView: View {
    private let viewModel: ListDetailViewModel

    init(viewModel: ListDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text(viewModel.item.title)
                    .font(.largeTitle.bold())
                Text(viewModel.item.subtitle)
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }

            Text("Item ID: \(viewModel.item.id.uuidString.prefix(8))...")
                .font(.caption)
                .monospaced()
                .foregroundStyle(.tertiary)

            Button("Show Actions") {
                viewModel.didTapActions()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
