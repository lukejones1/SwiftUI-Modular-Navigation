import SwiftUI

struct AppRootView: View {
    @StateObject var coordinator: AppCoordinator

    var body: some View {
        switch coordinator.screen {
        case .onboarding:
            AppComposition.makeOnboardingFlowView(
                experiment: coordinator.onboardingExperiment,
                onComplete: coordinator.completeOnboarding
            )

        case .authenticated:
            TabView(selection: $coordinator.selectedTab) {
                AppComposition.makeHomeFlowView(
                    router: coordinator.homeRouter,
                    onOpenSettings: coordinator.openSettings
                )
                .tag(AppTab.home)
                .tabItem { Label("Home", systemImage: "house") }

                AppComposition.makeProfileFlowView(
                    router: coordinator.profileRouter
                )
                .tag(AppTab.profile)
                .tabItem { Label("Profile", systemImage: "person") }

                AppComposition.makeAccountFlowView(
                    router: coordinator.accountRouter,
                    onLogout: coordinator.logout,
                    onOpenSettings: coordinator.openSettings
                )
                .tag(AppTab.account)
                .tabItem { Label("Account", systemImage: "gearshape") }
            }
            .sheet(isPresented: $coordinator.isPresentingSettings) {
                AppComposition.makeSettingsFlowView(
                    onDismiss: coordinator.dismissSettings
                )
            }
            .onOpenURL(perform: coordinator.handleDeepLink)
        }
    }
}
