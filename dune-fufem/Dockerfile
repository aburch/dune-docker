FROM duneci/dune:2.4

USER root
WORKDIR /
RUN apt-get update && apt-get install --no-install-recommends --yes \
  libdune-grid-glue-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

USER duneci
WORKDIR /duneci/modules
RUN git clone -b releases/2.4-1 https://git.imp.fu-berlin.de/agnumpde/dune-elasticity.git
RUN git clone -b releases/2.4-1 https://git.imp.fu-berlin.de/agnumpde/dune-fufem.git
RUN git clone -b releases/2.4-compatible https://gitlab.dune-project.org/staging/dune-functions.git
RUN git clone -b releases/2.4-1 https://git.imp.fu-berlin.de/agnumpde/dune-solvers.git
RUN git clone -b releases/2.4 https://gitlab.dune-project.org/pdelab/dune-typetree.git
RUN dunecontrol all

WORKDIR /duneci
ENV DUNE_CONTROL_PATH=.:/duneci/modules
