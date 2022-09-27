#!/bin/bash

# Simple script for running PFLOTRAN-OGS with less typing 

# Call this as:
# pft [infile] [number of processors]
# For example:
# pft spe10.in 4


$MPI_PATH -n $2 $PFT_PATH -pflotranin $1
