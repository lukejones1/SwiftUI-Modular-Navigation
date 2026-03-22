import Foundation
import Navigation

@MainActor
@Observable
final class OnboardingCoordinator {
    let router = Router<OnboardingStep, OnboardingSheet>()
    private let experiment: OnboardingExperiment
    private let onComplete: () -> Void

    init(experiment: OnboardingExperiment, onComplete: @escaping () -> Void) {
        self.experiment = experiment
        self.onComplete = onComplete
    }

    // MARK: - Flow Logic

    func didCompleteWelcome() {
        switch experiment {
        case .videoFirst:
            router.push(.valuePropVideo)
        case .signUpFirst, .minimal:
            router.push(.signUp)
        }
    }

    func didCompleteSignUp() {
        switch experiment {
        case .videoFirst:
            router.push(.notifications)
        case .signUpFirst:
            router.push(.profileSetup)
        case .minimal:
            onComplete()
        }
    }

    func didCompleteProfileSetup() {
        router.push(.notifications)
    }

    func didCompleteValuePropVideo() {
        router.push(.signUp)
    }

    func didCompleteNotifications() {
        onComplete()
    }

    func didTapSkip() {
        onComplete()
    }

    func didTapShowTerms() {
        router.present(sheet: .termsAndConditions)
    }

    func didDismissTerms() {
        router.dismissSheet()
    }
}
