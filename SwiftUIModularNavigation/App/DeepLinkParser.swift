import Foundation

struct DeepLinkParser {
    private static let scheme = "swiftuimodularnavigation"

    static func parse(_ url: URL) -> AppDestination? {
        guard url.scheme == scheme else { return nil }

        let components = url.pathComponents.filter { $0 != "/" }

        switch components.first {
        case "home":
            if components.count == 1 { return .tab(.home) }
            if components.count == 3,
               components[1] == "item",
               let id = UUID(uuidString: components[2]) {
                return .homeDetail(itemID: id)
            }
            return nil

        case "profile":
            return .tab(.profile)

        case "account":
            return .tab(.account)

        case "settings":
            return .settings

        default:
            return nil
        }
    }
}
