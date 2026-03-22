// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Home",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Home", targets: ["Home"]),
    ],
    dependencies: [
        .package(path: "../Navigation"),
    ],
    targets: [
        .target(name: "Home", dependencies: ["Navigation"]),
    ]
)
