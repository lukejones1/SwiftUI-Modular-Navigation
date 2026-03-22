import SwiftUI
import Navigation

public struct ProfileComposer {
    public static func make(
        router: Router<ProfilePushDestination, ProfileSheetDestination>
    ) -> some View {
        ProfileFlowView(router: router)
    }
}
