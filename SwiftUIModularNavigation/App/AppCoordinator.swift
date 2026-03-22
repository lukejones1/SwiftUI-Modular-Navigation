import SwiftUI
import Navigation
import Home
import Profile
import Account
import Onboarding

enum RootScreen {
    case onboarding
    case authenticated
}

@MainActor
final class AppCoordinator: ObservableObject {
    @Published var screen: RootScreen = .onboarding
    @Published var selectedTab: AppTab = .home
    @Published var isPresentingSettings = false

    private(set) var homeRouter = Router<HomePushDestination, HomeSheetDestination>()
    private(set) var profileRouter = Router<ProfilePushDestination, ProfileSheetDestination>()
    private(set) var accountRouter = Router<AccountPushDestination, AccountSheetDestination>()

    /// In production this would come from a remote config or experiment service
    private(set) var onboardingExperiment: OnboardingExperiment = .signUpFirst

    // MARK: - Flow Logic

    func completeOnboarding() {
        screen = .authenticated
    }

    func logout() {
        homeRouter.popToRoot()
        profileRouter.popToRoot()
        accountRouter.popToRoot()
        isPresentingSettings = false
        screen = .onboarding
    }

    func openSettings() {
        isPresentingSettings = true
    }

    func dismissSettings() {
        isPresentingSettings = false
    }

    // MARK: - Deep Linking

    func handleDeepLink(_ url: URL) {
        guard let destination = DeepLinkParser.parse(url) else { return }

        switch destination {
        case .tab(let tab):
            screen = .authenticated
            selectedTab = tab

        case .homeDetail(let itemID):
            screen = .authenticated
            selectedTab = .home
            homeRouter.popToRoot()
            homeRouter.push(.detail(item: ListItem(id: itemID, title: "Deep Link Item", subtitle: "Opened via deep link")))

        case .settings:
            screen = .authenticated
            isPresentingSettings = true
        }
    }
}
