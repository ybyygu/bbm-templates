#! /usr/bin/env bash

# this script will be called by BBM and be executed in a temporary directory
# all files in that directory will be removed when job done

# load VASP related environment variables (e.g vasp535)
source ~/apps/vasp/env.rc

## Prepare other input files
# copy important files into the .tmp* scratch directory,
cp "$BBM_TPL_DIR/INCAR" .
cp "$BBM_TPL_DIR/POTCAR" .
cp "$BBM_TPL_DIR/KPOINTS" .

function cleanup()
{
  echo User Interrupted. Exit now ...
  # PLEASE CHANGE IF NEEDED
  pkill vasp
}
trap cleanup SIGTERM

# https://unix.stackexchange.com/questions/146756/forward-sigterm-to-child-in-bash
# now it is ready to run interactive vasp

# PLEASE CHANGE `vasp535`
run-vasp -x vasp535 --interactive -vvv &

wait
