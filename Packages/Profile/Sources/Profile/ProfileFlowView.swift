import SwiftUI
import Navigation

public struct ProfileFlowView: View {
    @Bindable private var router: Router<ProfilePushDestination, ProfileSheetDestination>

    init(router: Router<ProfilePushDestination, ProfileSheetDestination>) {
        self.router = router
    }

    public var body: some View {
        NavigationStack(path: $router.path) {
            ProfileView(
                onEditProfile: { router.present(sheet: .editProfile) },
                onViewHistory: { router.push(.viewHistory) }
            )
            .navigationDestination(for: ProfilePushDestination.self) { destination in
                view(for: destination)
            }
        }
        .sheet(item: $router.sheet) { destination in
            sheetView(for: destination)
        }
    }

    // MARK: - Internal View Factory

    @ViewBuilder
    private func view(for destination: ProfilePushDestination) -> some View {
        switch destination {
        case .viewHistory:
            HistoryView()
        }
    }

    @ViewBuilder
    private func sheetView(for destination: ProfileSheetDestination) -> some View {
        switch destination {
        case .editProfile:
            EditProfileView(onDismiss: { router.dismissSheet() })
        }
    }
}
