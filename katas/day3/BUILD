load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")

cc_library(
    name = "day3",
    srcs = ["src/day3.cpp"],
    hdrs = ["src/day3.hpp"],
)

cc_test(
    name = "test_day3",
    srcs = ["src/test_day3.cpp"],
    deps = [
        ":day3",
        "@googletest//:gtest_main",
    ],
)

cc_binary(
    name = "benchmark_day3",
    srcs = ["src/benchmark_day3.cpp"],
    deps = [
        ":day3",
        "@google_benchmark//:benchmark",
    ],
)
