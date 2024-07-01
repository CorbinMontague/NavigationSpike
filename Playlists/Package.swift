// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Playlists",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Playlists",
            targets: ["Playlists"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Navigation", path: "../Navigation"),
        .package(name: "Core", path: "../Core")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Playlists",
            dependencies: ["Navigation", "Core"]),
        .testTarget(
            name: "PlaylistsTests",
            dependencies: ["Playlists", "Navigation", "Core"]),
    ]
)
