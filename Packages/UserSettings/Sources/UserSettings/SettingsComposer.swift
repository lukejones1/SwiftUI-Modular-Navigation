import SwiftUI

public struct SettingsComposer {
    public static func make(
        onDismiss: @escaping () -> Void
    ) -> some View {
        SettingsFlowView(onDismiss: onDismiss)
    }
}
