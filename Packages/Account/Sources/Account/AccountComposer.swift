import SwiftUI
import Navigation

public struct AccountComposer {
    public static func make(
        router: Router<AccountPushDestination, AccountSheetDestination>,
        onLogout: @escaping () -> Void,
        onOpenSettings: @escaping () -> Void
    ) -> some View {
        AccountFlowView(router: router, onLogout: onLogout, onOpenSettings: onOpenSettings)
    }
}
