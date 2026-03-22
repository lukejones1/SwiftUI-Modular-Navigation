import Foundation

public struct ListItem: Identifiable, Hashable {
    public let id: UUID
    public let title: String
    public let subtitle: String

    public init(id: UUID = UUID(), title: String, subtitle: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
    }

    public static func samples() -> [ListItem] {
        [
            ListItem(title: "Build Router", subtitle: "Generic navigation state container"),
            ListItem(title: "Add Deep Links", subtitle: "URL → AppDestination mapping"),
            ListItem(title: "Wire Composition Root", subtitle: "View factory closures at the app level"),
            ListItem(title: "Write Tests", subtitle: "Router state + DeepLinkParser + AppCoordinator"),
            ListItem(title: "Extract AppCoordinator", subtitle: "Only when orchestration logic demands it"),
        ]
    }
}
