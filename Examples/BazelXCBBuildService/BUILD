load(
    "@//:xcodeproj_targets.bzl",
    "XCODEPROJ_TARGETS",
)

load(
    "@build_bazel_rules_apple//apple:macos.bzl",
    "macos_command_line_application",
)
load(
    "@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)
load(
    "@rules_xcodeproj//xcodeproj:defs.bzl",
    "xcodeproj",
    "top_level_target"
)

swift_library(
    name = "BazelXCBBuildService.library",
    module_name = "BazelXCBBuildService",
    srcs = glob(["Sources/**/*.swift"]),
    deps = [
        "//BazelXCBBuildService/BEP",
        "@com_github_apple_swift_log//:Logging",
        "@com_github_apple_swift_nio//:NIO",
        "@com_github_mobilenativefoundation_xcbbuildserviceproxykit//:XCBBuildServiceProxyKit",
        "@com_github_mobilenativefoundation_xcbbuildserviceproxykit//:XCBProtocol",
        "@com_github_mobilenativefoundation_xcbbuildserviceproxykit//:XCBProtocol_12_0",
        "@com_github_mobilenativefoundation_xcbbuildserviceproxykit//:XCBProtocol_13_0",
    ],
)

macos_command_line_application(
    name = "BazelXCBBuildService",
    minimum_os_version = "11.0",
    deps = [":BazelXCBBuildService.library"],
    visibility = ["//visibility:public"],
)

xcodeproj(
    name = "xcodeproj",
    project_name = "BazelXCBuildService",
    top_level_targets = XCODEPROJ_TARGETS,
    tags = ["manual"],
)

sh_test(
    name = "BazelXCBBuildServiceIntegrationTests",
    size = "small",
    srcs = ["integration_tests.sh"],
    data = [
        ":BazelXCBBuildService",
    ],
    deps = ["@bazel_tools//tools/bash/runfiles"],
)

sh_test(
    name = "write_shim_tests",
    size = "small",
    srcs = ["write_shim_tests.sh"],
    data = [
        "write_shim.sh",
    ],
    deps = ["@bazel_tools//tools/bash/runfiles"],
)
