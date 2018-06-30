// swift-tools-version:4.0
import PackageDescription

let package:Package = Package(
    name:"SwiftToShell",
    products:[.library(name:"SwiftToShell", type:.dynamic, targets:["SwiftToShell"])],
    targets:[.target(name:"SwiftToShell", dependencies:[])]
)
