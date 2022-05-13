workspace(name = "swift-mujoco")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

git_repository(
    name = "build_bazel_rules_swift",
    commit = "36b915411f53a42f4f6b3ac7b15f4a40ffec619c",
    remote = "https://github.com/bazelbuild/rules_swift.git",
    shallow_since = "1651689310 -0700",
)

load("@build_bazel_rules_swift//swift:repositories.bzl", "swift_rules_dependencies")

swift_rules_dependencies()

load("@build_bazel_rules_swift//swift:extras.bzl", "swift_rules_extra_dependencies")

swift_rules_extra_dependencies()

# Mojoco dependency.

http_archive(
    name = "mujoco",
    build_file = "mujoco.BUILD",
    sha256 = "3f1804d28833295a310aac23279401936f2558dee63cd3778429577e4ab55dff",
    urls = ["https://github.com/deepmind/mujoco/releases/download/2.1.5/mujoco-2.1.5-linux-x86_64.tar.gz"],
)

# Swift formatter.

new_git_repository(
    name = "SwiftArgumentParser",
    build_file = "swift-argument-parser.BUILD",
    commit = "82905286cc3f0fa8adc4674bf49437cab65a8373",
    remote = "https://github.com/apple/swift-argument-parser.git",
    shallow_since = "1647436700 -0500",
)

new_git_repository(
    name = "SwiftSystem",
    build_file = "swift-system.BUILD",
    commit = "836bc4557b74fe6d2660218d56e3ce96aff76574",
    remote = "https://github.com/apple/swift-system.git",
    shallow_since = "1638472952 -0800",
)

new_git_repository(
    name = "SwiftToolsSupportCore",
    build_file = "swift-tools-support-core.BUILD",
    commit = "b7667f3e266af621e5cc9c77e74cacd8e8c00cb4",
    remote = "https://github.com/apple/swift-tools-support-core.git",
    shallow_since = "1643831290 -0800",
)

new_git_repository(
    name = "SwiftSyntax",
    build_file = "swift-syntax.BUILD",
    commit = "0b6c22b97f8e9320bca62e82cdbee601cf37ad3f",
    remote = "https://github.com/apple/swift-syntax.git",
    shallow_since = "1647591231 +0100",
)

new_git_repository(
    name = "SwiftFormat",
    build_file = "swift-format.BUILD",
    commit = "e6b8c60c7671066d229e30efa1e31acf57be412e",
    remote = "https://github.com/apple/swift-format.git",
    shallow_since = "1647972246 -0700",
)

# buildifier is written in Go and hence needs rules_go to be built.
# See https://github.com/bazelbuild/rules_go for the up to date setup instructions.

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "d1ffd055969c8f8d431e2d439813e42326961d0942bdf734d2c95dc30c369566",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.24.5/rules_go-v0.24.5.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.24.5/rules_go-v0.24.5.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

http_archive(
    name = "bazel_gazelle",
    sha256 = "b85f48fa105c4403326e9525ad2b2cc437babaa6e15a3fc0b1dbab0ab064bc7c",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

git_repository(
    name = "com_github_bazelbuild_buildtools",
    commit = "174cbb4ba7d15a3ad029c2e4ee4f30ea4d76edce",
    remote = "https://github.com/bazelbuild/buildtools.git",
    shallow_since = "1607975103 +0100",
)
