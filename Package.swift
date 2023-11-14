// swift-tools-version: 5.9

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
            dependencies: []/*,
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]*/),
        .testTarget(
            name: "TargetActionTests",
            dependencies: ["TargetAction"]),
    ]
)
