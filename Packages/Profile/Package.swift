// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Profile",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Profile", targets: ["Profile"]),
    ],
    dependencies: [
        .package(path: "../Navigation"),
    ],
    targets: [
        .target(name: "Profile", dependencies: ["Navigation"]),
    ]
)
