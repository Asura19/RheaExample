// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Account",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Account",
            targets: ["Account"]),
    ],
    dependencies: [
        .package(name: "RheaExtension", path: "../RheaExtension"),
        .package(url: "https://github.com/reers/Rhea.git", branch: "feat/register_time_with_macro")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Account",
            dependencies: [
                .product(name: "RheaExtension", package: "RheaExtension"),
                .product(name: "RheaTime", package: "Rhea")
            ]
        ),
    ]
)
