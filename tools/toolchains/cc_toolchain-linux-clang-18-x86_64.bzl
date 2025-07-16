"""
Toolchain configuration for Linux clang 18 x86_64 compiler targeting Linux x86_64 platform.
This module provides the necessary configuration for the C/C++ toolchain.
"""

load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "feature", "flag_group", "flag_set", "tool_path")
load("@rules_cc//cc/common:cc_common.bzl", "cc_common")

all_link_actions = [
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "gcc",
            path = "/usr/bin/clang",
        ),
        tool_path(
            name = "ld",
            path = "/usr/bin/lld",
        ),
        tool_path(
            name = "ar",
            path = "/usr/bin/ar",
        ),
        tool_path(
            name = "cpp",
            path = "/bin/false",
        ),
        tool_path(
            name = "gcov",
            path = "/bin/false",
        ),
        tool_path(
            name = "nm",
            path = "/bin/false",
        ),
        tool_path(
            name = "objdump",
            path = "/bin/false",
        ),
        tool_path(
            name = "strip",
            path = "/bin/false",
        ),
    ]

    features = [
        feature(
            name = "default_linker_flags",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = all_link_actions,
                    flag_groups = ([
                        flag_group(
                            flags = [
                                "-lstdc++",
                                "-lm",
                                "-stdlib=libc++",
                            ],
                        ),
                    ]),
                ),
            ],
        ),
        feature(
            name = "default_cxx_standard",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                    flag_groups = [
                        flag_group(
                            flags = ["-std=c++23", "-stdlib=libc++"],
                        ),
                    ],
                ),
            ],
        ),
        feature(
            name = "strict_warnings",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                    flag_groups = [
                        flag_group(
                            flags = [
                                "-Wall",
                                "-Wextra",
                                "-Wpedantic",
                                "-Werror",
                                "-Wconversion",
                                "-Wshadow",
                                "-Wunused",
                                "-Wold-style-cast",
                            ],
                        ),
                    ],
                ),
            ],
        ),
        feature(
            name = "address_sanitizer",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile] + all_link_actions,
                    flag_groups = [
                        flag_group(
                            flags = ["-fsanitize=address", "-fno-omit-frame-pointer"],
                        ),
                    ],
                ),
                flag_set(
                    actions = all_link_actions,
                    flag_groups = [
                        flag_group(
                            flags = ["-fsanitize=address"],
                        ),
                    ],
                ),
            ],
        ),
        feature(
            name = "undefined_behavior_sanitizer",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile] + all_link_actions,
                    flag_groups = [
                        flag_group(
                            flags = ["-fsanitize=undefined", "-fno-omit-frame-pointer"],
                        ),
                    ],
                ),
                flag_set(
                    actions = all_link_actions,
                    flag_groups = [
                        flag_group(
                            flags = ["-fsanitize=undefined", "-lubsan"],
                        ),
                    ],
                ),
            ],
        ),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,
        cxx_builtin_include_directories = [
            "/usr/lib/llvm-18/lib/clang/18/include",
            "/usr/lib/llvm-18/include/c++",
            "/usr/include",
            "/usr/lib/llvm-18/lib/clang/18/share",
        ],
        toolchain_identifier = "local",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "x86_64",
        target_libc = "glibc-2.39",
        compiler = "clang",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
