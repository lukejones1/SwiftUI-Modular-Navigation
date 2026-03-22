import SwiftUI

@MainActor
@Observable
public final class Router<Push: Hashable, Sheet: Hashable & Identifiable> {
    // Public for @Bindable binding in flow views
    public var path = NavigationPath()
    public var sheet: Sheet?

    public init() {}

    // MARK: - Push

    public func push(_ destination: Push) {
        path.append(destination)
    }

    public func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    public func popToRoot() {
        path = NavigationPath()
    }

    // MARK: - Sheet

    public func present(sheet destination: Sheet) {
        sheet = destination
    }

    public func dismissSheet() {
        sheet = nil
    }
}
