load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")

cc_binary(
    name = "app",
    srcs = ["src/main.cpp"],
    deps = [
        ":lib",
    ],
)

cc_library(
    name = "lib",
    srcs = glob(
        ["src/**/*.cpp"],
        exclude = ["src/main.cpp"],
    ),
    hdrs = glob(["include/**/*.hpp"]),
    strip_include_prefix = "include",
)

cc_test(
    name = "app_test",
    srcs = ["test/test_lib.cpp"],
    deps = [
        ":lib",
        "@googletest//:gtest_main",
    ],
)
