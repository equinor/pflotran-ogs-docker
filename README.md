# pflotran-ogs-docker
Docker image for PFLOTRAN-OGS v1.6
https://docs.opengosim.com/

# Tags
The image is tagged with:
- "latest" 
- PFLOTRAN-OGS version in the form of 1.6_sv9
- Short SHA of the last commit of PFLOTRAN-OGS

Tested to run on:
- Ubuntu 20.04 (Native and WSL 2) on x86-64
- Ubuntu 22.04 (Native and WSL 2) on x86-64
- Debian 11.3 (Native and chromeOS crostini) on x86-64

# To run
This image runs as root in order to have permission to the host volume
## CLI

`docker run -v <YOUR_HOST_WORK_DIR>:/app/work gchr.io/equinor/pflotran-ogs-docker:latest <INPUT_FILE_NAME> <N_THREAD>`

## Interactive
`docker run -it -v <YOUR_HOST_WORK_DIR>:/app/work --entrypoint=/bin/bash gchr.io/equinor/pflotran-ogs-docker:latest`

Once inside the interactive terminal of the container you can then run either:
- `pft <INPUT_FILE_NAME> <N_THREAD>`
- `$MPI_PATH -n <N_THREAD> $PFT_PATH -pflotranin <INPUT_FILE_NAME>`

# Environmental variables

`PETSC_DIR` Path to PETSc

`MPI_PATH` Path to mpiexec

`PFT_PATH` Path to compiled pflotran binary

You may also want to set `TZ`
