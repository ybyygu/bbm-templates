#! /usr/bin/env bash

# require gosh >= 0.0.25
parent_dir=$(realpath "$BBM_TPL_DIR/..")
source "$parent_dir/env.rc"

# 1. prepare SIESTA input files
# require gosh >= 0.0.25
ln -s "$parent_dir"/psml/* . 2>/dev/null
ln -s "$BBM_TPL_DIR"/default.fdf . 2>/dev/null

# Make SIESTA resume from last job. This could reduce electronic step costs.
# cp "$BBM_JOB_DIR/siesta.DM" . 2>/dev/null

# 2. read fdf stream from stdin, write stdout to siesta.log for parsing
tee input.fdf | mpirun siesta > siesta.log 2>/dev/null

# 3. save important files to bbm job starting dir
# require gosh >= 0.0.25
# cp siesta.DM "$BBM_JOB_DIR/" 2>/dev/null

# 4. parse calculated results
gosh-adaptor siesta siesta.log
