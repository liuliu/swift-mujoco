// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var dependencies: [Package.Dependency] = [
  .package(
    name: "C_mujoco", url: "https://github.com/liuliu/mujoco.git",
    .revision("d2caa777473fe0bd9f6edd77aa99442fe534d431")),
  .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0"),
]

#if swift(>=5.6)
  dependencies.append(.package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"))
#endif

let package = Package(
  name: "MuJoCo",
  platforms: [.macOS(.v10_14), .iOS(.v11), .watchOS(.v3), .tvOS(.v10)],
  products: [
    .library(name: "MuJoCo", type: .static, targets: ["MuJoCo"]),
    .executable(name: "simulate", targets: ["simulate"]),
    .executable(name: "codegen", targets: ["codegen"]),
  ],
  dependencies: dependencies,
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
      dependencies: [
        "CShim_mujoco", "C_mujoco",
        .target(name: "C_glfw", condition: .when(platforms: [.macOS, .linux])),
      ],
      path: "Sources",
      exclude: ["CShim", "C_glfw", "codegen", "BUILD.bazel"]),
    .executableTarget(
      name: "simulate",
      dependencies: ["MuJoCo", .product(name: "Numerics", package: "swift-numerics")],
      path: "Examples/simulate",
      sources: [
        "main.swift"
      ]),
    .target(
      name: "ChangeCases",
      path: "Sources/codegen",
      exclude: [
        "main.swift", "enumDecl.swift", "functionExtension.swift", "parseHeaders.swift",
        "structExtension.swift",
      ],
      sources: [
        "changeCases.swift"
      ]),
    .target(
      name: "MuJoCoCSyntax",
      dependencies: ["ChangeCases"],
      path: "Sources/codegen",
      exclude: ["changeCases.swift", "main.swift"],
      sources: [
        "enumDecl.swift",
        "functionExtension.swift",
        "parseHeaders.swift",
        "structExtension.swift",
      ]),
    .executableTarget(
      name: "codegen",
      dependencies: ["MuJoCoCSyntax"],
      path: "Sources/codegen",
      exclude: [
        "changeCases.swift", "enumDecl.swift", "functionExtension.swift", "parseHeaders.swift",
        "structExtension.swift",
      ],
      sources: [
        "main.swift"
      ]),
    .testTarget(
      name: "Tests",
      dependencies: ["MuJoCo"],
      path: "Tests",
      exclude: ["main.swift", "BUILD.bazel"]),
  ]
)
