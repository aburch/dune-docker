FROM duneci/base:9

USER root
WORKDIR /
RUN apt-get update && apt-get install --no-install-recommends --yes \
  gnuplot-nox \
  libalberta-dev \
  libscotchmetis-dev \
  libug-dev \
  python-vtk6 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

USER duneci
WORKDIR /duneci/modules
RUN git clone https://gitlab.dune-project.org/core/dune-common.git
RUN git clone https://gitlab.dune-project.org/core/dune-geometry.git
RUN git clone https://gitlab.dune-project.org/core/dune-grid.git
RUN git clone https://gitlab.dune-project.org/core/dune-istl.git
RUN git clone https://gitlab.dune-project.org/core/dune-localfunctions.git
RUN ./dune-common/bin/dunecontrol all

USER root
WORKDIR /
RUN ln -s /duneci/modules/dune-common/bin/dunecontrol /usr/local/bin/

USER duneci
WORKDIR /duneci
