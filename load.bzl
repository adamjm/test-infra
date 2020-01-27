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

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

def repositories():

    http_archive(
        name = "bazel_toolchains",
        sha256 = "a5635f7c47d08cae4c5690a0c5a6c5d4276c9f6fe7a510659c8435c525ef0d41",
        strip_prefix = "bazel-toolchains-2.0.3",
        urls = [
    	"https://github.com/bazelbuild/bazel-toolchains/releases/download/2.0.3/bazel-toolchains-2.0.3.tar.gz",
    	"https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/archive/2.0.3.tar.gz",
        ],
    )
    http_archive(
        name = "io_k8s_repo_infra",
        sha256 = "5ee2a8e306af0aaf2844b5e2c79b5f3f53fc9ce3532233f0615b8d0265902b2a",
        strip_prefix = "repo-infra-0.0.1-alpha.1",
        urls = [
            "https://github.com/kubernetes/repo-infra/archive/v0.0.1-alpha.1.tar.gz",
        ],
    )
    http_archive(
        name = "io_bazel_rules_docker",
        sha256 = "94b11b407db41482c5a55062a008494e1ac33f473d342091da3755779336278e",
        strip_prefix = "rules_docker-0.12.0",
        urls = ["https://github.com/adamjm/rules_docker/releases/download/v0.12.0/rules_docker-v0.12.0-ppc64le.tar.gz"],
    )

    http_archive(
        name = "io_bazel_rules_k8s",
        sha256 = "8953f8e1f79a73a961bef869e33cd2a0e04c320f9d63c7567290c7cce8537c26",
        strip_prefix = "rules_k8s-0.3",
        urls = ["https://github.com/adamjm/rules_k8s/releases/download/v0.3/rules_k8s-0.3-ppc64le.tar.gz"],
    )

    # https://github.com/bazelbuild/rules_nodejs
    http_archive(
        name = "build_bazel_rules_nodejs",
        sha256 = "8d15c36155a1e6f53e0722ea6227ea31ac8b6726959a7fa2230b115b53d15457",
        urls = ["https://github.com/adamjm/rules_nodejs/releases/download/0.36.0/rules_nodejs-0.36.0-ppc64le.tar.gz"],
    )

    # Python setup
    # pip_import() calls must live in WORKSPACE, otherwise we get a load() after non-load() error
    git_repository(
        name = "rules_python",
        commit = "94677401bc56ed5d756f50b441a6a5c7f735a6d4",
        remote = "https://github.com/bazelbuild/rules_python.git",
        shallow_since = "1573842889 -0500",
    )

    # TODO(fejta): get this to work
    git_repository(
        name = "io_bazel_rules_appengine",
        commit = "fdbce051adecbb369b15260046f4f23684369efc",
        remote = "https://github.com/bazelbuild/rules_appengine.git",
        shallow_since = "1552415147 -0400",
        #tag = "0.0.8+but-this-isn't-new-enough", # Latest at https://github.com/bazelbuild/rules_appengine/releases.
    )

    new_git_repository(
        name = "com_github_operator_framework_community_operators",
        build_file_content = """
exports_files([
    "upstream-community-operators/prometheus/alertmanager.crd.yaml",
    "upstream-community-operators/prometheus/prometheus.crd.yaml",
    "upstream-community-operators/prometheus/prometheusrule.crd.yaml",
    "upstream-community-operators/prometheus/servicemonitor.crd.yaml",
])
""",
        commit = "efda5dc98fd580ab5f1115a50a28825ae4fe6562",
        remote = "https://github.com/operator-framework/community-operators.git",
        shallow_since = "1568320223 +0200",
    )

    http_archive(
        name = "io_bazel_rules_jsonnet",
        sha256 = "68b5bcb0779599065da1056fc8df60d970cffe8e6832caf13819bb4d6e832459",
        strip_prefix = "rules_jsonnet-0.2.0",
        urls = ["https://github.com/bazelbuild/rules_jsonnet/archive/0.2.0.tar.gz"],
    )
