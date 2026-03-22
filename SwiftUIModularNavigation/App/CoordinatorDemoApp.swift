import SwiftUI

@main
struct SwiftUIModularNavigationApp: App {
    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            AppRootView(coordinator: coordinator)
        }
    }
}
