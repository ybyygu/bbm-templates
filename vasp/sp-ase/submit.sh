#! /usr/bin/env bash

## Create POSCAR from stdin with user defined template
cat > POSCAR

## Prepare other input files
# copy important files into the .tmp* scratch directory,
# which will be automatically removed if job finished.
cp ../INCAR .
cp ../POTCAR .
cp ../KPOINTS .

# PLEASE CHANGE
# submit vasp.
/share/apps/vasp/bin/vasp535-static

# PLEASE CHANGE
# extract energy and forces from OUTCAR
/share/apps/vasp/bin/vasp-adaptor OUTCAR
