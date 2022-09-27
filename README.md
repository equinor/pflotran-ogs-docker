# pflotran-ogs-docker
Docker image for PFLOTRAN-OGS v1.6
https://docs.opengosim.com/

Tested to run on:
- Ubuntu 20.04 (Native and WSL 2) on x86-64
- Ubuntu 22.04 (Native and WSL 2) on x86-64
- Debian 11.3 (Native and chromeOS crostini) on x86-64

# To run

`docker run -it --mount src=<YOUR_HOST_WORK_DIR>,dst=/app/work,type=bind gchr.io/equinor/pflotran-ogs-docker:latest `

Once inside the interactive terminal of the container you can then run `$MPI_PATH -n <N_THREAD> $PFT_PATH -pflotranin <PATH_TO_INPUT_FILE>`

# Environmental variables

`PETSC_DIR` Path to PETSc

`MPI_PATH` Path to mpiexec

`PFT_PATH` Path to compiled pflotran binary

You may also want to set `TZ`