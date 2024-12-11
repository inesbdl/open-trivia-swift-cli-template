// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "opentrivia",
    dependencies: [
        .package(path: "./Alamofire")
    ],
    targets: [
        .executableTarget(
            name: "opentrivia",
            dependencies: ["Alamofire"],
            path: "Sources/opentrivia"
        ),
        .testTarget(
            name: "opentriviaTests",
            dependencies: ["opentrivia"]
        )
    ]
)

