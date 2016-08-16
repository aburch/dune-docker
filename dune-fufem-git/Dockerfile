FROM duneci/dune:git

USER duneci
WORKDIR /duneci/modules
RUN git clone https://git.imp.fu-berlin.de/agnumpde/dune-elasticity.git
RUN git clone https://git.imp.fu-berlin.de/agnumpde/dune-fufem.git
RUN git clone https://gitlab.dune-project.org/staging/dune-functions.git
RUN git clone https://gitlab.dune-project.org/extensions/dune-grid-glue.git
RUN git clone https://git.imp.fu-berlin.de/agnumpde/dune-matrix-vector.git
RUN git clone https://git.imp.fu-berlin.de/agnumpde/dune-solvers.git
RUN git clone https://gitlab.dune-project.org/pdelab/dune-typetree.git
RUN dunecontrol all

WORKDIR /duneci
