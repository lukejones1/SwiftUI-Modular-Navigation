import SwiftUI
import Navigation

public struct HomeFlowView: View {
    @Bindable private var router: Router<HomePushDestination, HomeSheetDestination>
    private let onOpenSettings: () -> Void

    init(
        router: Router<HomePushDestination, HomeSheetDestination>,
        onOpenSettings: @escaping () -> Void
    ) {
        self.router = router
        self.onOpenSettings = onOpenSettings
    }

    public var body: some View {
        NavigationStack(path: $router.path) {
            ListView(
                onSelectItem: { item in router.push(.detail(item: item)) },
                onOpenSettings: onOpenSettings
            )
            .navigationDestination(for: HomePushDestination.self) { destination in
                view(for: destination)
            }
        }
        .sheet(item: $router.sheet) { destination in
            sheetView(for: destination)
        }
    }

    // MARK: - Internal View Factory

    @ViewBuilder
    private func view(for destination: HomePushDestination) -> some View {
        switch destination {
        case .detail(let item):
            ListDetailView(
                viewModel: ListDetailViewModel(
                    item: item,
                    onBack: { router.pop() },
                    onShowActions: { router.present(sheet: .itemActions(item: item)) }
                )
            )
        }
    }

    @ViewBuilder
    private func sheetView(for destination: HomeSheetDestination) -> some View {
        switch destination {
        case .itemActions(let item):
            ItemActionsView(
                item: item,
                onDismiss: { router.dismissSheet() }
            )
        }
    }
}
