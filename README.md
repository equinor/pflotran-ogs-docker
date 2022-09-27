# pflotran-ogs-docker
Docker image for PFLOTRAN-OGS v1.6
https://docs.opengosim.com/

# To Run

```docker run -it --mount src=<YOUR_HOST_WORK_DIR>,dst=/app/work,type=bind gchr.io/equinor/pflotran-ogs-docker:latest ```

# Environmental variables

`PETSC_DIR` Path to PETSc

`MPI_PATH` Path to mpiexec

`PFT_PATH` Path to compiled pflotran binary