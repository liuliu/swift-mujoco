// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MuJoCo",
  platforms: [.macOS(.v10_14), .iOS(.v11), .watchOS(.v3), .tvOS(.v10)],
  products: [
    .library(name: "MuJoCo", type: .static, targets: ["MuJoCo"]),
    .executable(name: "simulate", targets: ["simulate"]),
    .executable(name: "codegen", targets: ["codegen"]),
  ],
  dependencies: [
    .package(
      name: "C_mujoco", url: "https://github.com/liuliu/mujoco.git",
      .revision("8cdb034f4447b15d6a80e9f169e122a4a8c808e2")),
    .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0"),
  ],
  targets: [
    .systemLibrary(
      name: "C_glfw",
      pkgConfig: "glfw3",
      providers: [.brew(["glfw"]), .apt(["libglfw3-dev"])]
    ),
    .target(
      name: "CShim_mujoco",
      dependencies: ["C_mujoco"],
      path: "Sources/CShim",
      sources: [
        "CShim.c"
      ],
      publicHeadersPath: "."),
    .target(
      name: "MuJoCo",
      dependencies: ["CShim_mujoco", "C_glfw", "C_mujoco"],
      path: "Sources",
      exclude: ["CShim", "C_glfw", "codegen"]),
    .target(
      name: "simulate",
      dependencies: ["MuJoCo", .product(name: "Numerics", package: "swift-numerics")],
      path: "Examples/simulate",
      sources: [
        "main.swift"
      ]),
    .target(
      name: "ChangeCases",
      path: "Sources/codegen",
      sources: [
        "changeCases.swift"
      ]),
    .target(
      name: "MuJoCoCSyntax",
      dependencies: ["ChangeCases"],
      path: "Sources/codegen",
      sources: [
        "enumDecl.swift",
        "functionExtension.swift",
        "parseHeaders.swift",
        "structExtension.swift",
      ]),
    .target(
      name: "codegen",
      dependencies: ["MuJoCoCSyntax"],
      path: "Sources/codegen",
      sources: [
        "main.swift"
      ]),
  ]
)
