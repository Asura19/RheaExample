// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "RheaExtension",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v7),
        .macOS(.v10_15),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "RheaExtension", targets: ["RheaExtension"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "601.0.1"),
        .package(url: "https://github.com/reers/Rhea.git", branch: "main")
    ],
    targets: [
        .macro(
            name: "RheaExtensionMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(
            name: "RheaExtension",
            dependencies: [
                "RheaExtensionMacros",
                .product(name: "RheaTime", package: "Rhea")
            ],
            // 此处添加开启实验 feature
            swiftSettings: [.enableExperimentalFeature("SymbolLinkageMarkers")]
        ),
    ]
)
