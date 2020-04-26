# An example Bazel scaffold for large go project

## How to update bazel rules after updating go.mod

You can use

```bash
./hack/update-deps.sh
```

## How to update bazel's BUILD.bazel files

You can use

```bash
./hack/update-bazel.sh
```

## How to build and push image

You can use

```bash
bazel build //build/images/server:image
```

to build image and use

```bash
bazel build //build/images/server:push
```

for push `dev` tag image, or use 

```bash
bazel build //build/images:push
```

for pushing all images based on DOCKER_TAG in [hack/print-workspace-status.sh](hack/print-workspace-status.sh)
