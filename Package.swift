// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "TargetAction",
    platforms: [
        .macOS(.v11),
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "TargetAction",
            targets: ["TargetAction"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "TargetAction",
            dependencies: []
        ),
        .testTarget(
            name: "TargetActionTests",
            dependencies: ["TargetAction"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
