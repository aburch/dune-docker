Docker images for GitLab CI
===========================

Images
------

The current images are:

| image                    | parent          | description                                            |
|--------------------------|-----------------|--------------------------------------------------------|
| duneci/base:8            | debian:8        | Debian 8 with gcc 4.9.2, clang 3.5, cmake 3.0.2        |
| duneci/base:9            | debian:9        | Debian 9 with gcc 5.3.1, clang 3.6, cmake 3.4.1        |
| duneci/dune:2.3          | duneci/base:8   | DUNE 2.3 core modules from Debian                      |
| duneci/dune:2.4          | duneci/base:9   | DUNE 2.4 core modules from Debian                      |
| duneci/dune:git          | duneci/base:9   | DUNE 3.0-dev snapshot                                  |
| duneci/dune-fufem:2.4    | duneci/dune:2.4 | dune-{fufem,functions,solvers,typetree} (2.4 branches) |

`.gitlab-ci.yml`
----------------

To build with several images:
```
---
dune:2.3--gcc:
  image: duneci/dune:2.3
  script:
  - configure
  - build

dune:2.3--clang:
  image: duneci/dune:2.3
  script:
  - configure CXX=/usr/bin/clang++
  - build
```

You can also specify a default image and use it in several jobs:

```
---
image: duneci/dune:2.4

dune:2.4--gcc:
  script:
  - configure
  - build

dune:2.4--clang:
  script:
  - configure CXX=/usr/bin/clang++
  - build
```
