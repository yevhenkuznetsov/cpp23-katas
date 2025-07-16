load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")

cc_library(
    name = "day1",
    srcs = ["src/day1.cpp"],
    hdrs = ["src/day1.hpp"],
)

cc_test(
    name = "test_day1",
    srcs = ["src/test_day1.cpp"],
    deps = [
        ":day1",
        "@googletest//:gtest_main",
    ],
)
