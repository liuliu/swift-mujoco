load("@build_bazel_rules_swift//swift:swift.bzl", "swift_interop_hint")

cc_library(
    name = "C_mujoco",
    srcs = glob([
        "src/**/*.c",
        "src/**/*.cc",
        "src/**/*.h",
        "src/**/*.inc",
    ]),
    hdrs = glob(["include/mujoco/*.h"]),
    copts = ["-fPIC"],
    defines = ["mjUSEPLATFORMSIMD"],
    includes = [
        "include",
        "src",
    ],
    linkopts = [],
    local_defines = [
        "_GNU_SOURCE",
        "CCD_STATIC_DEFINE",
        "MUJOCO_DLL_EXPORTS",
    ],
    tags = ["swift_module=C_mujoco"],
    visibility = ["//visibility:public"],
    deps = [
        "@ccd",
        "@lodepng",
        "@qhull",
        "@tinyobjloader",
        "@tinyxml2",
    ],
    aspect_hints = [":C_mujoco_swift_interop"],
)

swift_interop_hint(
    name = "C_mujoco_swift_interop",
    module_name = "C_mujoco",
)
