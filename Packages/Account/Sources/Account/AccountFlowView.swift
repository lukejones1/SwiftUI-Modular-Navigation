import SwiftUI
import Navigation

public struct AccountFlowView: View {
    @Bindable private var router: Router<AccountPushDestination, AccountSheetDestination>
    private let onLogout: () -> Void
    private let onOpenSettings: () -> Void

    init(
        router: Router<AccountPushDestination, AccountSheetDestination>,
        onLogout: @escaping () -> Void,
        onOpenSettings: @escaping () -> Void
    ) {
        self.router = router
        self.onLogout = onLogout
        self.onOpenSettings = onOpenSettings
    }

    public var body: some View {
        NavigationStack(path: $router.path) {
            AccountView(
                onOpenSettings: onOpenSettings,
                onSecuritySettings: { router.push(.securitySettings) },
                onLogout: { router.present(sheet: .confirmLogout) }
            )
            .navigationDestination(for: AccountPushDestination.self) { destination in
                view(for: destination)
            }
        }
        .sheet(item: $router.sheet) { destination in
            sheetView(for: destination)
        }
    }

    // MARK: - Internal View Factory

    @ViewBuilder
    private func view(for destination: AccountPushDestination) -> some View {
        switch destination {
        case .securitySettings:
            SecuritySettingsView()
        }
    }

    @ViewBuilder
    private func sheetView(for destination: AccountSheetDestination) -> some View {
        switch destination {
        case .confirmLogout:
            ConfirmLogoutView(
                onConfirm: {
                    router.dismissSheet()
                    onLogout()
                },
                onCancel: { router.dismissSheet() }
            )
        }
    }
}
