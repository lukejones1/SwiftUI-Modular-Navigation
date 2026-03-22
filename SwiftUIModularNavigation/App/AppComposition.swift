import SwiftUI
import Navigation
import Home
import Profile
import Account
import Onboarding
import UserSettings

@MainActor
struct AppComposition {

    static func makeOnboardingFlowView(
        experiment: OnboardingExperiment,
        onComplete: @escaping () -> Void
    ) -> some View {
        OnboardingComposer.make(experiment: experiment, onComplete: onComplete)
    }

    static func makeHomeFlowView(
        router: Router<HomePushDestination, HomeSheetDestination>,
        onOpenSettings: @escaping () -> Void
    ) -> some View {
        HomeComposer.make(router: router, onOpenSettings: onOpenSettings)
    }

    static func makeProfileFlowView(
        router: Router<ProfilePushDestination, ProfileSheetDestination>
    ) -> some View {
        ProfileComposer.make(router: router)
    }

    static func makeAccountFlowView(
        router: Router<AccountPushDestination, AccountSheetDestination>,
        onLogout: @escaping () -> Void,
        onOpenSettings: @escaping () -> Void
    ) -> some View {
        AccountComposer.make(router: router, onLogout: onLogout, onOpenSettings: onOpenSettings)
    }

    static func makeSettingsFlowView(
        onDismiss: @escaping () -> Void
    ) -> some View {
        SettingsComposer.make(onDismiss: onDismiss)
    }
}
