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
    dependencies: [
        .package(url: "https://https://github.com/Pasha-69-iOS-Developer/Bubble_tabBar", .upToNextMajor(from: "1.0.0"))
    ],
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
