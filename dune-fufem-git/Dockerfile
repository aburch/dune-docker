FROM registry.dune-project.org/docker/ci/dune:git
ARG DUNECI_PARALLEL

USER duneci
WORKDIR /duneci/modules
RUN duneci-install-module https://git.imp.fu-berlin.de/agnumpde/dune-matrix-vector.git \
  && duneci-install-module https://git.imp.fu-berlin.de/agnumpde/dune-fufem.git \
  && duneci-install-module https://git.imp.fu-berlin.de/agnumpde/dune-solvers.git \
  && duneci-install-module https://git.imp.fu-berlin.de/agnumpde/dune-elasticity.git \
  && duneci-install-module https://gitlab.dune-project.org/extensions/dune-grid-glue.git

WORKDIR /duneci
