FROM duneci/base:9

USER root
WORKDIR /
RUN apt-get update && apt-get install --no-install-recommends --yes \
  gnuplot-nox \
  libalberta-dev \
  libscotchmetis-dev \
  python-vtk6 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

USER duneci
RUN duneci-install-module https://gitlab.dune-project.org/core/dune-common.git \
  && duneci-install-module https://gitlab.dune-project.org/core/dune-geometry.git \
  && duneci-install-module https://gitlab.dune-project.org/staging/dune-uggrid.git \
  && duneci-install-module https://gitlab.dune-project.org/core/dune-grid.git \
  && duneci-install-module https://gitlab.dune-project.org/core/dune-istl.git \
  && duneci-install-module https://gitlab.dune-project.org/core/dune-localfunctions.git

USER root
WORKDIR /
RUN ln -s /duneci/modules/dune-common/bin/dunecontrol /usr/local/bin/

USER duneci
WORKDIR /duneci
RUN ln -sf /duneci/modules/dune-common/bin/dune-ctest /duneci/bin/
