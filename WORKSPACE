# gazelle:repository_macro repos.bzl%go_repositories
workspace(name = "com_github_weixiao_huang_bazel_go_scaffold")

load("//build:deps.bzl", "repositories")

repositories()

load("@io_k8s_repo_infra//:load.bzl", _repo_infra_repos = "repositories")

_repo_infra_repos()

load("@io_k8s_repo_infra//:repos.bzl", "configure", "repo_infra_go_repositories")

# use k8s.io/repo-infra to configure go and bazel
# default minimum_bazel_version is 0.29.1
configure(
    go_version = "1.14",
    rbe_name = None,
)

load("//:repos.bzl", "go_repositories")

# load go dependencies imported from go.mod
go_repositories()

# supplement go repos in repo-infra's go.mod
repo_infra_go_repositories()
