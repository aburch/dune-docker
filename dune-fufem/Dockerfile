FROM dune:2.4
RUN mkdir modules

WORKDIR /dune/modules
RUN git clone -b releases/2.4-1 https://git.imp.fu-berlin.de/agnumpde/dune-fufem.git
RUN git clone -b releases/2.4-compatible https://gitlab.dune-project.org/staging/dune-functions.git
RUN git clone https://git.imp.fu-berlin.de/agnumpde/dune-solvers.git
RUN git clone -b releases/2.4 https://gitlab.dune-project.org/pdelab/dune-typetree.git
RUN dunecontrol all

WORKDIR /dune
ENV DUNE_CONTROL_PATH=.:/dune/modules
