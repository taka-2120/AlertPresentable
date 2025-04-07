// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AlertPresentable",
    platforms: [.macOS(.v14), .iOS(.v17), .tvOS(.v17), .watchOS(.v10), .macCatalyst(.v17)],
    products: [
        .library(
            name: "AlertPresentable",
            targets: ["AlertPresentable"]
        ),
    ],
    targets: [
        .target(
            name: "AlertPresentable",
            resources: [
                .process("Localizable.xcstrings"),
            ]
        ),
    ]
)
