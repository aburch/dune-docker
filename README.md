Docker images for GitLab CI
===========================

Images
------

The current images are:

| image                    | parent          | description                                                |
|--------------------------|-----------------|------------------------------------------------------------|
| duneci/base:8            | debian:8        | Debian 8 with gcc 4.9.2, clang 3.5, cmake 3.0.2            |
| duneci/base:8-backports  | duneci/base:8   | Debian 8 with gcc 4.9.2, clang 3.8 (backport), cmake 3.0.2 |
| duneci/base:9            | debian:9        | Debian 9 with gcc 6.1.1, clang 3.8, cmake 3.6.2            |
| duneci/base:16.04        | ubuntu:16.04    | Ubuntu LTS 16.04 with gcc 5.4.0, clang 3.8.0, cmake 3.5.1  |
| duneci/base:16.10        | ubuntu:16.10    | Ubuntu LTS 16.10 with gcc 6.2.0, clang 3.8.1, cmake 3.5.2  |
| duneci/dune:2.3          | duneci/base:8   | DUNE 2.3 core modules from Debian                          |
| duneci/dune:2.4          | duneci/base:9   | DUNE 2.4 core modules from Debian                          |
| duneci/dune:git          | duneci/base:9   | DUNE 3.0-dev snapshot                                      |
| duneci/dune-fufem:2.4    | duneci/dune:2.4 | dune-{fufem,functions,solvers,typetree} (2.4 branches)     |
| duneci/dune-fufem:git    | duneci/dune:git | dune-{fufem,functions,solvers,typetree} (master branches)  |

`.gitlab-ci.yml`
----------------

Installing dependencies:
```
before_script:
  - duneci-install-module https://gitlab.dune-project.org/core/dune-common.git
  - duneci-install-module https://gitlab.dune-project.org/core/dune-geometry.git
```

To build with several images:
```
---
dune:2.4--gcc:
  image: duneci/dune:2.4
  script: duneci-standard-test

dune:2.4--clang:
  image: duneci/dune:2.4
  script: duneci-standard-test --opts=/duneci/opts.clang
```

You can also specify a default image and use it in several jobs:

```
---
image: duneci/dune:2.4

dune:2.4--gcc:
  script: duneci-standard-test

dune:2.4--clang:
  script: duneci-standard-test --opts=/duneci/opts.clang
```

For more information, take a look at the [GitLab documentation on `.gitlab-ci.yml`](https://docs.gitlab.com/ce/ci/yaml/README.html).

Updating gitlab-runner
----------------------

To update `gitlab-runner` on the VM:

```
docker pull gitlab/gitlab-runner:latest
docker stop gitlab-runner
docker rm -v gitlab-runner
docker run -d --name gitlab-runner --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner:latest
```
or, if a HTTP proxy is required,
```
docker run -d --name gitlab-runner --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -e ftp_proxy=${ftp_proxy} -e FTP_PROXY=${FTP_PROXY} \
  -e http_proxy=${http_proxy} -e HTTP_PROXY=${HTTP_PROXY} \
  -e https_proxy=${https_proxy} -e HTTPS_PROXY=${HTTPS_PROXY} \
  -e no_proxy=${no_proxy} -e NO_PROXY=${NO_PROXY} \
  gitlab/gitlab-runner:latest
```

The current version can be shown by running

```
docker exec gitlab-runner gitlab-runner -v
```
