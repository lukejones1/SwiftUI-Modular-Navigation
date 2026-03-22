import Foundation

public enum HomePushDestination: Hashable {
    case detail(item: ListItem)
}

public enum HomeSheetDestination: Hashable, Identifiable {
    case itemActions(item: ListItem)

    public var id: String {
        switch self {
        case .itemActions(let item): "itemActions-\(item.id)"
        }
    }
}
