// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RheaExtension",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "RheaExtension", targets: ["RheaExtension"]),
    ],
    dependencies: [
        .package(url: "https://github.com/reers/Rhea.git", from: "1.0.8")
    ],
    targets: [
        .target(
            name: "RheaExtension",
            dependencies: [
                .product(name: "RheaTime", package: "Rhea")
            ],
            // 此处添加开启实验 feature
            swiftSettings: [.enableExperimentalFeature("SymbolLinkageMarkers")]
        ),
    ]
)
