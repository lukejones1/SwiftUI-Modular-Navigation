import Foundation

@MainActor
@Observable
final class ListDetailViewModel {
    private(set) var item: ListItem
    private let onBack: () -> Void
    private let onShowActions: () -> Void

    init(
        item: ListItem,
        onBack: @escaping () -> Void,
        onShowActions: @escaping () -> Void
    ) {
        self.item = item
        self.onBack = onBack
        self.onShowActions = onShowActions
    }

    func didTapBack() { onBack() }
    func didTapActions() { onShowActions() }
}
