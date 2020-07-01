// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPCAP",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(name: "SwiftPCAP", targets: ["SwiftPCAP"])
    ],
    dependencies: [
        .package(url: "https://github.com/OperatorFoundation/SwiftHexTools", from: "1.1.3")
    ],
    targets: [
        .target(
            name: "SwiftPCAP",
            dependencies: ["Clibpcap"]
        ),
	.testTarget(
	    name: "SwiftPCAPTests",
	    dependencies: ["SwiftPCAP", "SwiftHexTools"]
	),
    .systemLibrary(name: "Clibpcap", providers: [.brew(["libpcap"]), .apt(["libpcap-dev"])])
    ]
)
