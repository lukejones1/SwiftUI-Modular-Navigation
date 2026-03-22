import Testing
import Foundation
@testable import SwiftUIModularNavigation
import Navigation
import Home
import Profile

@Suite("AppCoordinator")
struct AppCoordinatorTests {

    @Test("Starts on onboarding screen")
    @MainActor
    func initialState() {
        let coordinator = AppCoordinator()
        #expect(coordinator.screen == .onboarding)
    }

    @Test("Complete onboarding switches to authenticated")
    @MainActor
    func completeOnboarding() {
        let coordinator = AppCoordinator()

        coordinator.completeOnboarding()

        #expect(coordinator.screen == .authenticated)
    }

    @Test("Logout resets all routers and returns to onboarding")
    @MainActor
    func logout() {
        let coordinator = AppCoordinator()
        coordinator.screen = .authenticated
        coordinator.homeRouter.push(.detail(item: ListItem(title: "Test", subtitle: "Test")))
        coordinator.profileRouter.push(.viewHistory)
        coordinator.isPresentingSettings = true

        coordinator.logout()

        #expect(coordinator.screen == .onboarding)
        #expect(coordinator.homeRouter.path.isEmpty)
        #expect(coordinator.profileRouter.path.isEmpty)
        #expect(coordinator.accountRouter.path.isEmpty)
        #expect(coordinator.isPresentingSettings == false)
    }

    @Test("Open settings sets presenting flag")
    @MainActor
    func openSettings() {
        let coordinator = AppCoordinator()

        coordinator.openSettings()

        #expect(coordinator.isPresentingSettings == true)
    }

    @Test("Dismiss settings clears presenting flag")
    @MainActor
    func dismissSettings() {
        let coordinator = AppCoordinator()
        coordinator.isPresentingSettings = true

        coordinator.dismissSettings()

        #expect(coordinator.isPresentingSettings == false)
    }

    @Test("Deep link to home tab switches tab and authenticates")
    @MainActor
    func deepLinkHomeTab() {
        let coordinator = AppCoordinator()
        let url = URL(string: "swiftuimodularnavigation:///home")!

        coordinator.handleDeepLink(url)

        #expect(coordinator.screen == .authenticated)
        #expect(coordinator.selectedTab == .home)
    }

    @Test("Deep link to profile tab switches tab")
    @MainActor
    func deepLinkProfileTab() {
        let coordinator = AppCoordinator()
        let url = URL(string: "swiftuimodularnavigation:///profile")!

        coordinator.handleDeepLink(url)

        #expect(coordinator.screen == .authenticated)
        #expect(coordinator.selectedTab == .profile)
    }

    @Test("Deep link to home detail pushes onto home router")
    @MainActor
    func deepLinkHomeDetail() {
        let coordinator = AppCoordinator()
        let id = UUID()
        let url = URL(string: "swiftuimodularnavigation:///home/item/\(id.uuidString)")!

        coordinator.handleDeepLink(url)

        #expect(coordinator.screen == .authenticated)
        #expect(coordinator.selectedTab == .home)
        #expect(coordinator.homeRouter.path.count == 1)
    }

    @Test("Deep link to home detail clears existing home navigation first")
    @MainActor
    func deepLinkHomeDetailResetsPath() {
        let coordinator = AppCoordinator()
        coordinator.screen = .authenticated
        coordinator.homeRouter.push(.detail(item: ListItem(title: "Old", subtitle: "Old")))
        coordinator.homeRouter.push(.detail(item: ListItem(title: "Older", subtitle: "Older")))

        let id = UUID()
        let url = URL(string: "swiftuimodularnavigation:///home/item/\(id.uuidString)")!
        coordinator.handleDeepLink(url)

        #expect(coordinator.homeRouter.path.count == 1)
    }

    @Test("Deep link to settings presents settings sheet")
    @MainActor
    func deepLinkSettings() {
        let coordinator = AppCoordinator()
        let url = URL(string: "swiftuimodularnavigation:///settings")!

        coordinator.handleDeepLink(url)

        #expect(coordinator.screen == .authenticated)
        #expect(coordinator.isPresentingSettings == true)
    }

    @Test("Invalid deep link does nothing")
    @MainActor
    func invalidDeepLink() {
        let coordinator = AppCoordinator()
        let url = URL(string: "otherscheme:///home")!

        coordinator.handleDeepLink(url)

        #expect(coordinator.screen == .onboarding)
    }

    @Test("Onboarding experiment defaults to signUpFirst")
    @MainActor
    func defaultExperiment() {
        let coordinator = AppCoordinator()
        #expect(coordinator.onboardingExperiment == .signUpFirst)
    }
}
