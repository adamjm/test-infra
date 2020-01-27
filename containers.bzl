# Copyright 2019 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

def repositories():
    container_pull(
        name = "distroless-base",
        digest = "sha256:7fa7445dfbebae4f4b7ab0e6ef99276e96075ae42584af6286ba080750d6dfe5",
        registry = "docker.io",
        repository = "adamjm32/distroless-base",
        tag = "latest",
    )

    container_pull(
        name = "alpine-base",
        digest = "sha256:21e1b411f13fc5407401296a739a11e36b469854b5b982a4928738363e14f7a2",  # 2018/09/20
        registry = "docker.io",
        repository = "adamjm32/alpine",
        tag = "0.1",  # TODO(fejta): update or replace
    )

    container_pull(
        name = "alpine-bash",
        digest = "sha256:526e6e7cff714276999119f4f069187674bcb4679977b91d36edef2b727687fd",  # 2019/07/29
        registry = "docker.io",
        repository = "adamjm32/alpine-bash",
        tag = "latest",  # TODO(fejta): update or replace
    )

    container_pull(
        name = "boskosctl-base",
        digest = "sha256:a23c19a87857140926184d19e8e54812ba4a8acec4097386ca0993a248e83f8b",  # 2019/08/05
        registry = "gcr.io",
        repository = "k8s-testimages/boskosctl-base",
        tag = "latest",  # TODO(fejta): update or replace
    )

    container_pull(
        name = "gcloud-base",
        digest = "sha256:b61cca1da7d7e8b90abf6217750cd0c53b1f7130abb68cc0e0f94014924d9498",  # 2019/08/16
        registry = "docker.io",
        repository = "adamjm32/glcoud",
        tag = "latest",
    )

    container_pull(
        name = "git-base",
        digest = "sha256:9e140b130b76081402a4142c3b814ef87a8f5461a1f9b5e0a5afa1ae6c9fa841",  # 2018/07/02
        registry = "docker.io",
        repository = "adamjm32/git",
        tag = "0.2",  # TODO(fejta): update or replace
    )

    container_pull(
        name = "python",
        digest = "sha256:594a43a1eb22f5a37b15e0394fc0e39e444072e413f10a60bac0babe42280304",  # 2019/08/16
        registry = "index.docker.io",
        repository = "library/python",
        tag = "2",
    )

    container_pull(
        name = "gcloud-go",
        digest = "sha256:abedf2599191ba4c7ddaa411e8490bb8423e8d44554c2ee89048221c68fbafe0",  # 2019/01/25
        registry = "docker.io",
        repository = "adamjm32/gcloud-in-go",
        tag = "latest",  # TODO(fejta): update or replace
    )

    container_pull(
        name = "bazel-base",
        digest = "sha256:6c4e836d4415a2cbde73f68432664392090dae0995be979ef4ef8fc8d0c097f4",  # 2019/11/25
        registry = "docker.io",
        repository = "adamjm32/bazel_base",
        tag = "1.0.0",
    )
