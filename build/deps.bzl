load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    http_archive(
        name = "io_k8s_repo_infra",
        sha256 = "a6ca952e365600a17f56f0fc8e41016e1d13cfb2b74c0c29bad6bdba3e3d8a4d",
        strip_prefix = "repo-infra-0.0.3",
        urls = [
            "https://github.com/kubernetes/repo-infra/archive/v0.0.3.tar.gz",
        ],
    )

    # built-in versions of package rules will no longer be addressed
    # see https://docs.bazel.build/versions/3.1.0/be/pkg.html#deprecated
    http_archive(
        name = "rules_pkg",
        urls = [
            "https://github.com/bazelbuild/rules_pkg/releases/download/0.2.5/rules_pkg-0.2.5.tar.gz",
            "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.2.5/rules_pkg-0.2.5.tar.gz",
        ],
        sha256 = "352c090cc3d3f9a6b4e676cf42a6047c16824959b438895a76c2989c6d7c246a",
    )

    # Download the rules_docker repository at release v0.14.1
    http_archive(
        name = "io_bazel_rules_docker",
        sha256 = "dc97fccceacd4c6be14e800b2a00693d5e8d07f69ee187babfd04a80a9f8e250",
        strip_prefix = "rules_docker-0.14.1",
        urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.14.1/rules_docker-v0.14.1.tar.gz"],
    )

    # Web deps support for portal
    http_archive(
        name = "build_bazel_rules_nodejs",
        sha256 = "d0c4bb8b902c1658f42eb5563809c70a06e46015d64057d25560b0eb4bdc9007",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/1.5.0/rules_nodejs-1.5.0.tar.gz"],
    )
