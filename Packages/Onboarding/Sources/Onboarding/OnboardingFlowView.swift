import SwiftUI
import Navigation

public struct OnboardingFlowView: View {
    @State private var coordinator: OnboardingCoordinator

    init(experiment: OnboardingExperiment, onComplete: @escaping () -> Void) {
        self._coordinator = State(
            initialValue: OnboardingCoordinator(
                experiment: experiment,
                onComplete: onComplete
            )
        )
    }

    public var body: some View {
        @Bindable var router = coordinator.router
        NavigationStack(path: $router.path) {
            WelcomeView(
                onContinue: coordinator.didCompleteWelcome
            )
            .navigationDestination(for: OnboardingDestination.self) { destination in
                view(for: destination)
            }
        }
        .sheet(item: $router.sheet) { sheet in
            switch sheet {
            case .termsAndConditions:
                TermsView(onDismiss: coordinator.didDismissTerms)
            }
        }
    }

    @ViewBuilder
    private func view(for destination: OnboardingDestination) -> some View {
        switch destination {
        case .signUp:
            SignUpView(
                onComplete: coordinator.didCompleteSignUp,
                onShowTerms: coordinator.didTapShowTerms
            )
        case .profileSetup:
            ProfileSetupView(onComplete: coordinator.didCompleteProfileSetup)
        case .valuePropVideo:
            ValuePropVideoView(
                onComplete: coordinator.didCompleteValuePropVideo,
                onSkip: coordinator.didTapSkip
            )
        case .notifications:
            NotificationsView(
                onEnable: coordinator.didCompleteNotifications,
                onSkip: coordinator.didCompleteNotifications
            )
        }
    }
}
