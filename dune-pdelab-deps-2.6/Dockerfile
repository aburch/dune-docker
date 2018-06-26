FROM registry.dune-project.org/docker/ci/dune:2.6
ARG DUNECI_PARALLEL

USER duneci
RUN duneci-install-module -b releases/2.6 https://gitlab.dune-project.org/extensions/dune-alugrid.git
