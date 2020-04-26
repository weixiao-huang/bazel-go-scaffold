# gazelle:repository_macro repos.bzl%go_repositories
workspace(name = "com_github_weixiao_huang_bazel_go_scaffold")

load("//build:deps.bzl", "repositories")

repositories()

load("@io_k8s_repo_infra//:load.bzl", _repo_infra_repos = "repositories")

_repo_infra_repos()

# load rules_docker deps
load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

# load project base images
load("//build:containers.bzl", _base_container_pull = "repositories")

_base_container_pull()

# web support
load("@build_bazel_rules_nodejs//:index.bzl", "node_repositories", "yarn_install")

node_repositories(
    package_json = ["//portal:package.json"],
    node_version = "12.16.1",
    yarn_version = "1.19.1",
    node_repositories = {
        "12.16.1-darwin_amd64": ("node-v12.16.1-darwin-x64.tar.gz", "node-v12.16.1-darwin-x64", "34895bce210ca4b3cf19cd480e6563588880dd7f5d798f3782e3650580d35920"),
        "12.16.1-linux_amd64": ("node-v12.16.1-linux-x64.tar.gz", "node-v12.16.1-linux-x64", "b2d9787da97d6c0d5cbf24c69fdbbf376b19089f921432c5a61aa323bc070bea"),
        "12.16.1-windows_amd64": ("node-v12.16.1-win-x64.zip", "node-v12.16.1-win-x64", "b93b73572c5e495154a9823d494de5729c77d1c83b041171154c4b5f3f76b590"),
    },
    node_urls = [
        "https://nodejs.org/dist/v{version}/{filename}",
    ],
    yarn_urls = [
        "https://github.com/yarnpkg/yarn/releases/download/v{version}/{filename}",
    ],
)

yarn_install(
    name = "npm",
    package_json = "//portal:package.json",
    yarn_lock = "//portal:yarn.lock",
    quiet = False,
    manual_build_file_contents = """exports_files(["node_modules/.bin/vue-cli-service"])""",
)

# go support
load("@io_k8s_repo_infra//:repos.bzl", "configure", "repo_infra_go_repositories")

# use k8s.io/repo-infra to configure go and bazel
# default minimum_bazel_version is 0.29.1
configure(
    go_version = "1.14",
    rbe_name = None,
)

load("//:repos.bzl", "go_repositories", "go_repositories_patches")

# load go dependencies imported from go.mod
go_repositories()
go_repositories_patches()

# supplement go repos in repo-infra's go.mod
repo_infra_go_repositories()
