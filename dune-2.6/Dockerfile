FROM registry.dune-project.org/docker/ci/debian:10
ARG DUNECI_PARALLEL

USER duneci
RUN duneci-install-module -b releases/2.6 https://gitlab.dune-project.org/core/dune-common.git \
  && duneci-install-module -b releases/2.6 https://gitlab.dune-project.org/core/dune-geometry.git \
  && duneci-install-module -b releases/2.6 https://gitlab.dune-project.org/staging/dune-uggrid.git \
  && duneci-install-module -b releases/2.6 https://gitlab.dune-project.org/core/dune-grid.git \
  && duneci-install-module -b releases/2.6 https://gitlab.dune-project.org/core/dune-istl.git \
  && duneci-install-module -b releases/2.6 https://gitlab.dune-project.org/core/dune-localfunctions.git \
  && duneci-install-module -b releases/2.6 https://gitlab.dune-project.org/staging/dune-typetree.git \
  && duneci-install-module -b releases/2.6 https://gitlab.dune-project.org/staging/dune-functions.git
