// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Configuration",
    products: [
        .library(name: "Configuration", targets: ["Configuration"])
    ],
    targets:[
        .target(name:"Configuration", dependencies: []),
        .testTarget(name: "ConfigurationTests", dependencies: ["Configuration"])
    ]
)