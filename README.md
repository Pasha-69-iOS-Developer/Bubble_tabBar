# Bubble TabBar (SwiftUI)

<img src=https://github.com/user-attachments/assets/85eaefc4-558e-4e67-802a-257c355db55a width='250' height='250'>

[![Build Status](https://img.shields.io/badge/platforms-iOS%20%7C%20tvOS%20%7C%20macOS%20%7C%20watchOS-green.svg)](https://github.com/Jinxiansen/SwiftUI)
[![Swift](https://img.shields.io/badge/Swift-5.7-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-15.0-blue.svg)](https://developer.apple.com/xcode)
[![Xcode](https://img.shields.io/badge/macOS-17.0-blue.svg)](https://developer.apple.com/macOS)
[![MIT](https://img.shields.io/badge/licenses-MIT-red.svg)](https://opensource.org/licenses/MIT)

------------
## Introduction
This is custom TabBar for SwiftUI with Bubble selection animation and easy implementation works with +17 iOS

### Requirements
- iOS 17.0+ 
- Xcode 15.0+
- Swift 5.0+

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

> Xcode 15+ is required to build Bubble_tabBar using Swift Package Manager.

To integrate Bubble_TabBar into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://https://github.com/Pasha-69-iOS-Developer/Bubble_tabBar", .upToNextMajor(from: "1.0.0"))
]
```
## Example

```swift
    let tabs = [
        TabItem(icon: "house.fill", title: "Home", color: .blue) {
            // Your View is here
            HomeView()
        },
        TabItem(icon: "figure.wave", title: "Search", color: .green) {
            // Your View is here
            SettingsView()
        },
        TabItem(icon: "heart.fill", title: "Favorites", color: .pink) {
            // Your View is here
            Favorites()
        },
        TabItem(icon: "person.circle.fill", title: "Account", color: .black) {
            // Your View is here
            AccountView()
        }
    ]
    
    var body: some View {
        BubbleTabBar(
            tabs: tabs
        )


```
