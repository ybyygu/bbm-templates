#! /usr/bin/env bash

# Set root scratching directory for Gaussian calculations
export GAUSS_SCRDIR=/scratch/gaussian

# The scratch directory should be accessible by other users
mkdir -m 777 -p "$GAUSS_SCRDIR"
if [ ! $? -eq 0 ]; then
    echo "Failed to make scratch directory $GAUSS_SCRDIR on node `hostname`!" 1>&2
    exit 1
fi

# guess main gaussian exe name from symlink
CMD=`basename $0`

run-gaussian -vv -x $CMD $*



