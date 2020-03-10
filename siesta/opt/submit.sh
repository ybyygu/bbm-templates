#! /usr/bin/env bash

# require gosh >= 0.0.25
parent_dir=$(realpath "$BBM_TPL_DIR/..")
source "$parent_dir/env.rc"

# 1. prepare SIESTA input files
# require gosh >= 0.0.25
ln -s "$parent_dir"/psml/* .
ln -s "$BBM_TPL_DIR"/default.fdf .

# 2. read fdf stream from stdin
mpirun siesta > siesta.log

# 3. save important files to bbm job starting dir
# require gosh >= 0.0.25
# cp siesta.log "$BBM_JOB_DIR"/

# 4. parse calculated results
gosh-adaptor siesta siesta.log
