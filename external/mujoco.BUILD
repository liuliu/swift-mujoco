cc_import(
    name = "mujoco",
    shared_library = "mujoco-2.1.5/lib/libmujoco.so.2.1.5",
    deps = [
    ],
)

cc_library(
    name = "C_mujoco",
    hdrs = glob(["mujoco-2.1.5/include/*.h"]),
    includes = ["mujoco-2.1.5/include"],
    linkopts = [],
    tags = ["swift_module=C_mujoco"],
    visibility = ["//visibility:public"],
    deps = [":mujoco"],
)
