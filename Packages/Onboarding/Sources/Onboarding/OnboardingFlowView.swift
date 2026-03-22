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
        OnboardingFlowContent(coordinator: coordinator)
    }
}

/// Inner view that creates a @Bindable reference to the Router directly,
/// avoiding binding through the coordinator's `let` property.
private struct OnboardingFlowContent: View {
    let coordinator: OnboardingCoordinator
    @Bindable var router: Router<OnboardingStep, OnboardingSheet>

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
        self.router = coordinator.router
    }

    var body: some View {
        NavigationStack(path: $router.path) {
            WelcomeView(onContinue: coordinator.didCompleteWelcome)
                .navigationDestination(for: OnboardingStep.self) { step in
                    switch step {
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
        .sheet(item: $router.sheet) { sheet in
            switch sheet {
            case .termsAndConditions:
                TermsView(onDismiss: coordinator.didDismissTerms)
            }
        }
    }
}
