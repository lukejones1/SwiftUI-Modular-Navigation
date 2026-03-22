import SwiftUI

struct HistoryView: View {
    var body: some View {
        List {
            ForEach(0..<5) { i in
                Text("History item \(i + 1)")
            }
        }
        .navigationTitle("History")
    }
}
