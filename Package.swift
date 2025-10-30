// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SKSwiftSample",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "SKSwiftSample",
            targets: ["SKSwiftSample"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/rudderlabs/rudder-sdk-swift.git", branch: "develop")
    ],
    targets: [
        .target(
            name: "SKSwiftSample",
            dependencies: [
                .product(name: "RudderStackAnalytics", package: "rudder-sdk-swift")
            ]
        ),
        .testTarget(
            name: "SKSwiftSampleTests",
            dependencies: ["SKSwiftSample"]
        ),
    ]
)
