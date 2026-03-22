// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "UserSettings",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "UserSettings", targets: ["UserSettings"]),
    ],
    targets: [
        .target(name: "UserSettings"),
    ]
)
