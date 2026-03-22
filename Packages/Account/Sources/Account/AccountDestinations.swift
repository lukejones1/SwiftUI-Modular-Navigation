import Foundation

public enum AccountPushDestination: Hashable {
    case securitySettings
}

public enum AccountSheetDestination: Hashable, Identifiable {
    case confirmLogout

    public var id: String {
        switch self {
        case .confirmLogout: "confirmLogout"
        }
    }
}
