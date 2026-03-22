import SwiftUI
import Navigation

public struct HomeComposer {
    public static func make(
        router: Router<HomePushDestination, HomeSheetDestination>,
        onOpenSettings: @escaping () -> Void
    ) -> some View {
        HomeFlowView(router: router, onOpenSettings: onOpenSettings)
    }
}
