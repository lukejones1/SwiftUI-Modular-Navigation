// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Account",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Account", targets: ["Account"]),
    ],
    dependencies: [
        .package(path: "../Navigation"),
    ],
    targets: [
        .target(name: "Account", dependencies: ["Navigation"]),
    ]
)
