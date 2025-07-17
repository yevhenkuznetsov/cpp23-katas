load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")

cc_library(
    name = "day2",
    hdrs = ["src/day2.hpp"],
)

cc_test(
    name = "test_day2",
    srcs = ["src/test_day2.cpp"],
    deps = [
        ":day2",
        "@googletest//:gtest_main",
    ],
)
