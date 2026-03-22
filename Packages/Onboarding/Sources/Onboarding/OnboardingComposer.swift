import SwiftUI

public struct OnboardingComposer {
    public static func make(
        experiment: OnboardingExperiment,
        onComplete: @escaping () -> Void
    ) -> some View {
        OnboardingFlowView(experiment: experiment, onComplete: onComplete)
    }
}
