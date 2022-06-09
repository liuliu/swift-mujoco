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
      .revision("5e2af0b65785d742b9de05c48c75d71354a3d23d")),
    .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "CShim_mujoco",
      dependencies: ["C_mujoco"],
      path: "Sources/CShim",
      sources: [
        "CShim.c"
      ],
      publicHeadersPath: "."),
    .target(
      name: "C_glfw",
      path: "Sources/glfw",
      sources: ["glfw.c"],
      publicHeadersPath: ".",
      linkerSettings: [.linkedLibrary("glfw")]),
    .target(
      name: "MuJoCo",
      dependencies: ["CShim_mujoco", "C_glfw", "C_mujoco"],
      path: "Sources",
      exclude: ["CShim", "glfw", "codegen"]),
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
