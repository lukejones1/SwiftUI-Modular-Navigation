import Testing
import Foundation
@testable import CoordinatorDemo

@Suite("DeepLinkParser")
struct DeepLinkParserTests {

    @Test("Parses home tab")
    func homeTab() {
        let url = URL(string: "coordinatordemo:///home")!
        #expect(DeepLinkParser.parse(url) == .tab(.home))
    }

    @Test("Parses profile tab")
    func profileTab() {
        let url = URL(string: "coordinatordemo:///profile")!
        #expect(DeepLinkParser.parse(url) == .tab(.profile))
    }

    @Test("Parses account tab")
    func accountTab() {
        let url = URL(string: "coordinatordemo:///account")!
        #expect(DeepLinkParser.parse(url) == .tab(.account))
    }

    @Test("Parses settings")
    func settings() {
        let url = URL(string: "coordinatordemo:///settings")!
        #expect(DeepLinkParser.parse(url) == .settings)
    }

    @Test("Parses home detail with UUID")
    func homeDetail() {
        let id = UUID()
        let url = URL(string: "coordinatordemo:///home/item/\(id.uuidString)")!
        #expect(DeepLinkParser.parse(url) == .homeDetail(itemID: id))
    }

    @Test("Returns nil for unknown scheme")
    func unknownScheme() {
        let url = URL(string: "otherscheme:///home")!
        #expect(DeepLinkParser.parse(url) == nil)
    }

    @Test("Returns nil for unknown path")
    func unknownPath() {
        let url = URL(string: "coordinatordemo:///unknown")!
        #expect(DeepLinkParser.parse(url) == nil)
    }

    @Test("Returns nil for malformed home detail")
    func malformedHomeDetail() {
        let url = URL(string: "coordinatordemo:///home/item/not-a-uuid")!
        #expect(DeepLinkParser.parse(url) == nil)
    }
}
