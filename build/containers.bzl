load("@io_bazel_rules_docker//container:container.bzl", "container_pull")
load(":utils.bzl", "DOCKER_REGISTRY_FOR_PULL")

def repositories():
    container_pull(
        name = "centos7",
        registry = DOCKER_REGISTRY_FOR_PULL,
        repository = "library/centos",
        tag = "7",
        digest = "sha256:285bc3161133ec01d8ca8680cd746eecbfdbc1faa6313bd863151c4b26d7e5a5",
    )
