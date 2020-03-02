// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPCAP",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(name: "SwiftPCAP", targets: ["SwiftPCAP"])
    ],
    targets: [
        .target(
            name: "SwiftPCAP",
            dependencies: ["Clibpcap"]
        ),
        .systemLibrary(name: "Clibpcap", pkgConfig: "libpcap")
    ]
)
