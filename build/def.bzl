load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_image",
    "container_push",
)

def project_image(
        base,
        name = "image",
        visibility = ["//visibility:public"],
        directory = "/usr/local/bin",
        **kwargs):
    container_image(
        name = name,
        base = base,
        visibility = visibility,
        directory = directory,
        **kwargs
    )

def project_push(
        repository,
        name = "push",
        format = "Docker",
        image = ":image",
        registry = "{DOCKER_REGISTRY}",
        tag = "dev",
        **kwargs):
    container_push(
        name = name,
        format = format,
        image = image,
        registry = registry,
        repository = repository,
        tag = tag,
        **kwargs
    )
