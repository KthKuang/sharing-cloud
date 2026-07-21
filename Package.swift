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
    .package(url: "https://github.com/pointfreeco/swift-sharing", from: "2.0.0"),
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.14.0"),
    .package(url: "https://github.com/pointfreeco/swift-concurrency-extras", from: "1.3.0"),
    .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "1.5.0"),
  ],
  targets: [
    .target(
      name: "SharingCloud",
      dependencies: [
        .product(name: "ConcurrencyExtras", package: "swift-concurrency-extras"),
        .product(name: "Dependencies", package: "swift-dependencies"),
        .product(name: "IssueReporting", package: "xctest-dynamic-overlay"),
        .product(name: "Sharing", package: "swift-sharing"),
      ],
      path: "Sources"
    )
  ]
)
