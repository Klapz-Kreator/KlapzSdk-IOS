// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Klapz",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Klapz",
            targets: ["Klapz"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/kizitonwose/CountryPickerView", from: "3.3.0"),
         .package(url: "https://github.com/rlaguilar/MultilineTextField",from: "1.0.0"),
         .package(url: "https://github.com/NikKovIos/NKVPhonePicker", from: "2.1.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Klapz",
            dependencies: [
                .product(name: "CountryPickerView", package: "CountryPickerView"),
                .product(name: "MultilineTextField", package: "MultilineTextField"),
                .product(name: "NKVPhonePicker", package: "NKVPhonePicker")
            ],
            resources: [.copy("images/wihteklapz.png"),.copy("images/klapzicon.png"),.copy("images/noti.png"),.copy("images/klap2.png"),.copy("fonts/Montserrat-Bold.ttf"),.copy("fonts/Montserrat-Medium.ttf"),.copy("fonts/Montserrat-Regular.ttf"),.process("fonts") ]
            ),
    ]
)
