// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PlayKit_IMA",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PlayKit_IMA",
            targets: ["PlayKit_IMA"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kaltura/playkit-ios.git", .upToNextMajor(from: "3.22.0")),
        .package(url: "https://github.com/DaveWoodCom/XCGLogger.git", .upToNextMajor(from: "7.0.0")),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git",
            .upToNextMajor(from: "3.19.0")),
        .package(
            url: "https://github.com/jromanos-hiberus/swift-package-manager-google-interactive-media-ads-tvos.git",
            .upToNextMajor(from: "4.9.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PlayKit_IMA",
            dependencies: [
                .product(name: "PlayKit", package: "playkit-ios"),
                "XCGLogger",
                .product(
                    name: "GoogleInteractiveMediaAds",
                    package: "swift-package-manager-google-interactive-media-ads-ios",
                    condition: .when(platforms: [.iOS])
                ),
                .product(
                    name: "GoogleInteractiveMediaAdsTvOS",
                    package: "swift-package-manager-google-interactive-media-ads-tvos",
                    moduleAliases: ["GoogleInteractiveMediaAds": "GoogleInteractiveMediaAdsTvOS"],
                    condition: .when(platforms: [.tvOS])
                ),
            ],
            path: "Sources/"
        ),
    ]
)
