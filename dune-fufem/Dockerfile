FROM duneci/dune:2.4
ARG DUNECI_PARALLEL

USER root
WORKDIR /
RUN export DEBIAN_FRONTEND=noninteractive; \
  apt-get update && apt-get install --no-install-recommends --yes \
  libdune-grid-glue-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

USER duneci
WORKDIR /duneci

RUN  duneci-install-module -b releases/2.4 https://gitlab.dune-project.org/staging/dune-typetree.git \
  && duneci-install-module -b releases/2.4-compatible https://gitlab.dune-project.org/staging/dune-functions.git \
  && duneci-install-module -b releases/2.4-1 https://git.imp.fu-berlin.de/agnumpde/dune-fufem.git \
  && duneci-install-module -b releases/2.4-1 https://git.imp.fu-berlin.de/agnumpde/dune-solvers.git \
  && duneci-install-module -b releases/2.4-1 https://git.imp.fu-berlin.de/agnumpde/dune-elasticity.git
