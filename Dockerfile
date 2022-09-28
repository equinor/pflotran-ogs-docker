FROM ubuntu:20.04
LABEL org.opencontainers.image.source = "https://github.com/equinor/pflotran-ogs-docker"
ARG THREAD=2
ENV TZ=EUROPE/OSLO
ENV HOME_DIR=/app
ENV PFT_PATH=${HOME_DIR}/pflotran_ogs_1.6/src/pflotran/pflotran
ENV PETSC_DIR=${HOME_DIR}/petsc
ENV PETSC_ARCH=arch-linux2-c-opt
ENV MPI_PATH=${PETSC_DIR}/${PETSC_ARCH}/bin/mpiexec
ENV USER=pflotran_usr
ENV UID=1000

RUN apt update && \
    apt install git build-essential gfortran python python-six flex bison -y
# RUN groupadd --gid ${UID} ${USER} && useradd --uid ${UID} --gid ${UID} -m ${USER}

COPY pft /usr/bin/
RUN chmod 777 /usr/bin/pft
WORKDIR ${HOME_DIR}
# RUN chown ${USER} ${HOME_DIR}
# USER ${USER}


# Install PETSc OGS fork
RUN git clone --depth=1 -b master https://bitbucket.org/opengosim/petsc_ogs.git ${PETSC_DIR}
WORKDIR ${PETSC_DIR}
RUN ./configure --download-mpich=yes --download-hdf5=yes --download-fblaslapack=yes --download-metis=yes  --download-cmake=yes  --download-ptscotch=yes --download-hypre=yes --with-debugging=0 COPTFLAGS=-O3 CXXOPTFLAGS=-O3 FOPTFLAGS=-O3 -j${THREAD}
RUN make PETSC_DIR=${PETSC_DIR} PETSC_ARCH=${PETSC_ARCH} all -j${THREAD}

# Install PFLOTRAN-OGS
WORKDIR ${HOME_DIR}
RUN git clone --depth=1 -b pflotran_ogs_1.6 https://bitbucket.org/opengosim/pflotran_ogs_1.6.git 
WORKDIR ${HOME_DIR}/pflotran_ogs_1.6/src/pflotran
RUN make -j8 pflotran

ENV WORK_DIR=${HOME_DIR}/work
WORKDIR ${WORK_DIR}

ENTRYPOINT ["/bin/bash", "-c", "pft"]
