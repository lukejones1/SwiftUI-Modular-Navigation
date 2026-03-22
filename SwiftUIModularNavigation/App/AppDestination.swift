import Foundation

enum AppTab: String, Hashable {
    case home
    case profile
    case account
}

enum AppDestination: Equatable {
    case tab(AppTab)
    case homeDetail(itemID: UUID)
    case settings
}
