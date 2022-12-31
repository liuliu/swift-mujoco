load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def _maybe(repo_rule, name, **kwargs):
    """Executes the given repository rule if it hasn't been executed already.
    Args:
      repo_rule: The repository rule to be executed (e.g., `http_archive`.)
      name: The name of the repository to be defined by the rule.
      **kwargs: Additional arguments passed directly to the repository rule.
    """
    if not native.existing_rule(name):
        repo_rule(name = name, **kwargs)

def swift_mujoco_deps():
    """Loads common dependencies needed to compile the swift-mujoco library."""

    _maybe(
        new_git_repository,
        name = "lodepng",
        build_file = "@swift-mujoco//:external/lodepng.BUILD",
        commit = "5601b8272a6850b7c5d693dd0c0e16da50be8d8d",
        remote = "https://github.com/lvandeve/lodepng.git",
        shallow_since = "1641772872 +0100",
    )

    _maybe(
        new_git_repository,
        name = "tinyxml2",
        build_file = "@swift-mujoco//:external/tinyxml2.BUILD",
        commit = "e45d9d16d430a3f5d3eee9fe40d5e194e1e5e63a",
        remote = "https://github.com/leethomason/tinyxml2.git",
        shallow_since = "1648934420 -0700",
    )

    _maybe(
        new_git_repository,
        name = "tinyobjloader",
        build_file = "@swift-mujoco//:external/tinyobjloader.BUILD",
        commit = "8322e00ae685ea623ab6ac5a6cebcfa2d22fbf93",
        remote = "https://github.com/tinyobjloader/tinyobjloader.git",
        shallow_since = "1640603894 +0900",
    )

    _maybe(
        new_git_repository,
        name = "ccd",
        build_file = "@swift-mujoco//:external/ccd.BUILD",
        commit = "7931e764a19ef6b21b443376c699bbc9c6d4fba8",
        remote = "https://github.com/danfis/libccd.git",
        shallow_since = "1545480825 +0100",
    )

    _maybe(
        new_git_repository,
        name = "qhull",
        build_file = "@swift-mujoco//:external/qhull.BUILD",
        commit = "3df027b91202cf179f3fba3c46eebe65bbac3790",
        remote = "https://github.com/qhull/qhull.git",
        shallow_since = "1636586665 -0500",
    )

    _maybe(
        new_git_repository,
        name = "mujoco",
        build_file = "@swift-mujoco//:external/mujoco.BUILD",
        commit = "36641cdb2c0cf21360a42ddad54f0c460aa94398",
        remote = "https://github.com/deepmind/mujoco.git",
        shallow_since = "1670292968 -0800",
    )
