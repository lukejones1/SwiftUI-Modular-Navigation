// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Onboarding",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Onboarding", targets: ["Onboarding"]),
    ],
    dependencies: [
        .package(path: "../Navigation"),
    ],
    targets: [
        .target(name: "Onboarding", dependencies: ["Navigation"]),
        .testTarget(name: "OnboardingTests", dependencies: ["Onboarding", "Navigation"]),
    ]
)
