import Testing
import Foundation
@testable import Navigation

@Suite("Router")
struct RouterTests {

    @Test("Push adds to path")
    @MainActor
    func push() {
        let router = Router<String, MockSheet>()
        router.push("detail")
        #expect(router.path.count == 1)
    }

    @Test("Pop removes from path")
    @MainActor
    func pop() {
        let router = Router<String, MockSheet>()
        router.push("first")
        router.push("second")
        router.pop()
        #expect(router.path.count == 1)
    }

    @Test("Pop on empty path does nothing")
    @MainActor
    func popEmpty() {
        let router = Router<String, MockSheet>()
        router.pop()
        #expect(router.path.isEmpty)
    }

    @Test("PopToRoot clears entire path")
    @MainActor
    func popToRoot() {
        let router = Router<String, MockSheet>()
        router.push("first")
        router.push("second")
        router.push("third")
        router.popToRoot()
        #expect(router.path.isEmpty)
    }

    @Test("Present sheet sets sheet state")
    @MainActor
    func presentSheet() {
        let router = Router<String, MockSheet>()
        router.present(sheet: .example)
        #expect(router.sheet == .example)
    }

    @Test("Dismiss sheet clears sheet state")
    @MainActor
    func dismissSheet() {
        let router = Router<String, MockSheet>()
        router.present(sheet: .example)
        router.dismissSheet()
        #expect(router.sheet == nil)
    }
}

// MARK: - Test Helpers

enum MockSheet: String, Hashable, Identifiable {
    case example
    var id: String { rawValue }
}
