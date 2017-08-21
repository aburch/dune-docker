Docker images for GitLab CI
===========================

Images
------

The current images are:

| image                    | parent            | description                                                |
|--------------------------|-------------------|------------------------------------------------------------|
| duneci/base:8            | debian:8          | Debian 8 with gcc 4.9.2, clang 3.5, cmake 3.0.2            |
| duneci/base:8-backports  | duneci/base:8     | Debian 8 with gcc 4.9.2, clang 3.8 (backport), cmake 3.0.2 |
| duneci/base:9            | debian:9          | Debian 9 with gcc 6.3, clang 3.8, cmake 3.7                |
| duneci/base:10           | debian:10         | Debian 9 with gcc 7, clang 4.0, cmake 3.7                  |
| duneci/base:16.04        | ubuntu:16.04      | Ubuntu LTS 16.04 with gcc 5.4.0, clang 3.8.0, cmake 3.5.1  |
| duneci/base:16.10        | ubuntu:16.10      | Ubuntu 16.10 with gcc 6.2.0, clang 3.8.1, cmake 3.5.2      |
| duneci/dune:2.3          | duneci/base:8     | DUNE 2.3 core modules (Debian packages)                    |
| duneci/dune:2.4          | duneci/base:16.04 | DUNE 2.4 core modules (Debian packages)                    |
| duneci/dune:2.5          | duneci/base:9     | DUNE 2.5 core and staging modules (Debian packages)        |
| duneci/dune:git          | duneci/base:9     | DUNE master core and staging modules (Git)                 |
| duneci/dune-fufem:2.4    | duneci/dune:2.4   | dune-{fufem,functions,solvers,typetree} (2.4 branch)       |
| duneci/dune-fufem:git    | duneci/dune:git   | dune-{elasticity,fufem,grid-glue,solvers} (master branch)  |

`.gitlab-ci.yml`
----------------

Installing dependencies:
```yaml
before_script:
  - duneci-install-module https://gitlab.dune-project.org/core/dune-common.git
  - duneci-install-module https://gitlab.dune-project.org/core/dune-geometry.git
```

To build with several images:
```yaml
---
dune:2.4--gcc:
  image: duneci/dune:2.4
  script: duneci-standard-test

dune:2.4--clang:
  image: duneci/dune:2.4
  script: duneci-standard-test --opts=/duneci/opts.clang
```

You can also specify a default image and use it in several jobs:

```yaml
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

```shell
docker pull gitlab/gitlab-runner:latest
docker stop gitlab-runner
docker rm -v gitlab-runner
docker run -d --name gitlab-runner --restart always \
  --stop-signal SIGQUIT \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner:latest
```
or, if a HTTP proxy is required,
```shell
docker run -d --name gitlab-runner --restart always \
  --stop-signal SIGQUIT \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -e ftp_proxy=${ftp_proxy} -e FTP_PROXY=${FTP_PROXY} \
  -e http_proxy=${http_proxy} -e HTTP_PROXY=${HTTP_PROXY} \
  -e https_proxy=${https_proxy} -e HTTPS_PROXY=${HTTPS_PROXY} \
  -e no_proxy=${no_proxy} -e NO_PROXY=${NO_PROXY} \
  gitlab/gitlab-runner:latest
```

The current version can be shown by running

```shell
docker exec gitlab-runner gitlab-runner -v
```

See the [gitlab-runner changelog][] for a list of changes.

  [gitlab-runner changelog]: https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/CHANGELOG.md

Installing gitlab-runner
------------------------

To initially install gitlab-runner:

```shell
apt install docker.io
mkdir -p /srv/gitlab-runner/config
```
then follow the steps from [Updating gitlab-runner](#updating-gitlab-runner).

Register the runner with GitLab CI:
```shell
docker exec -it gitlab-runner gitlab-runner register
```

Finally edit `/srv/gitlab-runner/config/config.toml`:
```TOML
concurrent = 4
check_interval = 0

[[runners]]
  name = "<name>"
  url = "https://gitlab.dune-project.org/ci"
  token = "<private token from registration>"
  executor = "docker"

  # Set proxy variables if needed:
  environment = ["ftp_proxy=http://dune-proxy:3128", "http_proxy=http://dune-proxy:3128", "https_proxy=http://dune-proxy:3128", "no_proxy=127.0.0.1, localhost"]
  [runners.docker]
    # tls_verify = false
    image = "duneci/dune:latest"
    privileged = false
    security_opt = ["no-new-privileges"]
    disable_cache = false
    volumes = ["/cache"]
    allowed_images = ["docker.io/duneci/*", "duneci/*"]
    pull_policy = "if-not-present"
    # See [Proxy setup](#proxy-setup) below:
    network_mode = "gitlab-ci-dune"

    # OpenMPI-2 is unhappy with the (too long) default hostnames:
    hostname = "ci"
```
See the [documentation of GitLab runner's configuration](https://docs.gitlab.com/runner/configuration/advanced-configuration.html) for details.
Please also keep the [security considerations](https://docs.gitlab.com/runner/security/index.html) in mind.

Proxy setup
-----------

Setup network (once):
```shell
docker network create --internal --driver=bridge gitlab-ci-dune
```

Update and start proxy:
```shell
docker stop dune-proxy
docker rm -v dune-proxy
docker create --name dune-proxy \
  --restart always --security-opt no-new-privileges \
  -v /srv/dune-proxy:/srv/squid:ro \
  duneci/proxy
docker network connect gitlab-ci-dune dune-proxy
docker start dune-proxy
```

In gitlab-runner's `config.toml`:

```TOML
[[runners]]
  [runners.docker]
    network_mode = "gitlab-ci-dune"
```
