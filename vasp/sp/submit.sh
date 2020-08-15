#! /usr/bin/env bash

# load VASP related environment variables
source /share/apps/vasp/env.rc

## Create POSCAR from stdin with user defined template
cat > POSCAR

## Prepare other input files
# copy important files into the .tmp* scratch directory,
# which will be automatically removed if job finished.
cp "$BBM_JOB_DIR/INCAR" .
cp "$BBM_JOB_DIR/POTCAR" .
cp "$BBM_JOB_DIR/KPOINTS" .

# Make VASP resume from last job. This could reduce electronic step costs.
cp "$BBM_JOB_DIR/WAVECAR" . 2>/dev/null
cp "$BBM_JOB_DIR/CHGCAR" . 2>/dev/null

# PLEASE CHANGE
# submit vasp, ignoring stdout produced from vasp exe.
mpirun /share/apps/vasp/bin/vasp >/dev/null

# save CHGCAR and WAVECAR files for next step
cp CHGCAR WAVECAR "$BBM_JOB_DIR/" 2>/dev/null

# PLEASE CHANGE
# extract energy and forces from OUTCAR to stdout
gosh-adaptor vasp OUTCAR
