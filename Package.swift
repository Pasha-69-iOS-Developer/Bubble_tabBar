// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BubbleTabBar",
    platforms: [
        .iOS(.v17),
        .macCatalyst(.v17)
    ],
    products: [
        .library(
            name: "BubbleTabBar",
            targets: ["BubbleTabBar"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BubbleTabBar",
            dependencies: [],
            path: "Sources/BubbleTabBar"),
        .testTarget(
            name: "BubbleTabBarTests",
            dependencies: ["BubbleTabBar"]),
    ]
)
