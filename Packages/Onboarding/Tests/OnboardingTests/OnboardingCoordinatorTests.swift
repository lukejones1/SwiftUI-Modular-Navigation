import Testing
import Foundation
@testable import Onboarding
import Navigation

@Suite("OnboardingCoordinator")
struct OnboardingCoordinatorTests {

    // MARK: - Video First Experiment

    @Suite("Video First Experiment")
    struct VideoFirst {

        @Test("Welcome → value prop video")
        @MainActor
        func welcomePushesVideo() {
            let coordinator = makeCoordinator(experiment: .videoFirst)

            coordinator.didCompleteWelcome()

            #expect(coordinator.router.path.count == 1)
        }

        @Test("Sign up → notifications")
        @MainActor
        func signUpPushesNotifications() {
            let coordinator = makeCoordinator(experiment: .videoFirst)
            coordinator.didCompleteWelcome()
            coordinator.didCompleteValuePropVideo()

            coordinator.didCompleteSignUp()

            #expect(coordinator.router.path.count == 3)
        }

        @Test("Full flow: welcome → video → sign up → notifications → complete")
        @MainActor
        func fullFlow() {
            var completed = false
            let coordinator = OnboardingCoordinator(
                experiment: .videoFirst,
                onComplete: { completed = true }
            )

            coordinator.didCompleteWelcome()
            coordinator.didCompleteValuePropVideo()
            coordinator.didCompleteSignUp()
            coordinator.didCompleteNotifications()

            #expect(completed)
        }
    }

    // MARK: - Sign Up First Experiment

    @Suite("Sign Up First Experiment")
    struct SignUpFirst {

        @Test("Welcome → sign up")
        @MainActor
        func welcomePushesSignUp() {
            let coordinator = makeCoordinator(experiment: .signUpFirst)

            coordinator.didCompleteWelcome()

            #expect(coordinator.router.path.count == 1)
        }

        @Test("Sign up → profile setup")
        @MainActor
        func signUpPushesProfileSetup() {
            let coordinator = makeCoordinator(experiment: .signUpFirst)
            coordinator.didCompleteWelcome()

            coordinator.didCompleteSignUp()

            #expect(coordinator.router.path.count == 2)
        }

        @Test("Full flow: welcome → sign up → profile setup → notifications → complete")
        @MainActor
        func fullFlow() {
            var completed = false
            let coordinator = OnboardingCoordinator(
                experiment: .signUpFirst,
                onComplete: { completed = true }
            )

            coordinator.didCompleteWelcome()
            coordinator.didCompleteSignUp()
            coordinator.didCompleteProfileSetup()
            coordinator.didCompleteNotifications()

            #expect(completed)
        }
    }

    // MARK: - Minimal Experiment

    @Suite("Minimal Experiment")
    struct Minimal {

        @Test("Welcome → sign up")
        @MainActor
        func welcomePushesSignUp() {
            let coordinator = makeCoordinator(experiment: .minimal)

            coordinator.didCompleteWelcome()

            #expect(coordinator.router.path.count == 1)
        }

        @Test("Sign up completes immediately")
        @MainActor
        func signUpCompletes() {
            var completed = false
            let coordinator = OnboardingCoordinator(
                experiment: .minimal,
                onComplete: { completed = true }
            )

            coordinator.didCompleteWelcome()
            coordinator.didCompleteSignUp()

            #expect(completed)
        }
    }

    // MARK: - Shared Behaviour

    @Suite("Shared Behaviour")
    struct Shared {

        @Test("Skip completes onboarding from any experiment")
        @MainActor
        func skipCompletes() {
            var completed = false
            let coordinator = OnboardingCoordinator(
                experiment: .videoFirst,
                onComplete: { completed = true }
            )

            coordinator.didTapSkip()

            #expect(completed)
        }

        @Test("Show terms presents sheet")
        @MainActor
        func showTerms() {
            let coordinator = makeCoordinator(experiment: .signUpFirst)

            coordinator.didTapShowTerms()

            #expect(coordinator.router.sheet != nil)
        }

        @Test("Dismiss terms clears sheet")
        @MainActor
        func dismissTerms() {
            let coordinator = makeCoordinator(experiment: .signUpFirst)
            coordinator.didTapShowTerms()

            coordinator.didDismissTerms()

            #expect(coordinator.router.sheet == nil)
        }

        @Test("Router starts with empty path")
        @MainActor
        func initialState() {
            let coordinator = makeCoordinator(experiment: .signUpFirst)

            #expect(coordinator.router.path.isEmpty)
            #expect(coordinator.router.sheet == nil)
        }
    }
}

// MARK: - Helpers

@MainActor
private func makeCoordinator(experiment: OnboardingExperiment) -> OnboardingCoordinator {
    OnboardingCoordinator(experiment: experiment, onComplete: {})
}
