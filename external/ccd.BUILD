genrule(
    name = "config",
    outs = ["src/ccd/config.h"],
    cmd = "echo '#define CCD_DOUBLE' > $(OUTS)",
)

cc_library(
    name = "ccd",
    srcs = glob(["src/*.c"]) + glob(["src/*.h"]),
    hdrs = glob(["src/ccd/*.h"]) + [":config"],
    includes = ["src"],
    linkopts = [],
    visibility = ["//visibility:public"],
)
