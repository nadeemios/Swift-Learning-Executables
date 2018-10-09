// swift-tools-version:4.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftConceptsExecutable",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
     .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.0"),
     .package(url:"https://github.com/nadeemios/SwiftConcepts", from:"1.3.1" )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftConceptsExecutable",
            dependencies: ["Alamofire","SwiftConcepts"]),
//
    ]
)
