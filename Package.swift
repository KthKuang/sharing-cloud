// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "sharing-cloud",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v9),
  ],
  products: [
    .library(
      name: "SharingCloud",
      targets: ["SharingCloud"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-sharing", from: "2.0.0")
  ],
  targets: [
    .target(
      name: "SharingCloud",
      dependencies: [
        .product(name: "Sharing", package: "swift-sharing")
      ],
      path: "Sources"
    )
  ]
)
