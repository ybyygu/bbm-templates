#! /usr/bin/env bash

# Set root scratching directory for Gaussian calculations
export GAUSS_SCRDIR=/scratch/gaussian

# guess main gaussian exe name from symlink
CMD=`basename $0`

run-gaussian -vv -x $CMD $*



