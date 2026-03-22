import Foundation

enum OnboardingStep: Hashable {
    case signUp
    case profileSetup
    case valuePropVideo
    case notifications
}

enum OnboardingSheet: Hashable, Identifiable {
    case termsAndConditions

    var id: String {
        switch self {
        case .termsAndConditions: "terms"
        }
    }
}
