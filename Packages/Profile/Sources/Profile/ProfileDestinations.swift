import Foundation

public enum ProfilePushDestination: Hashable {
    case viewHistory
}

public enum ProfileSheetDestination: Hashable, Identifiable {
    case editProfile

    public var id: String {
        switch self {
        case .editProfile: "editProfile"
        }
    }
}
