
load(
    "@rules_xcodeproj//xcodeproj:defs.bzl",
    "top_level_target",
)

XCODEPROJ_TARGETS = [
    top_level_target(
        label = ":BazelXCBBuildService",
    ),
]