#! /usr/bin/env bash

# require gosh >= 0.0.25
parent_dir=/share/apps/siesta
source "$parent_dir/env.rc"

# 1. prepare SIESTA input files
# require gosh >= 0.0.25
# docker needs real files
cp "$parent_dir"/psml/* .
cp "$BBM_TPL_DIR"/default.fdf .

# 2. read fdf stream from stdin, write stdout to siesta.log for parsing
#tee input.fdf | docker run --rm -i -v $(pwd):$HOME siesta 2>&1 | tee siesta.log > "$BBM_JOB_DIR"/siesta.log
# siesta cmds in docker can be overridden
tee input.fdf | docker run --rm -i -v $(pwd):$HOME siesta bash -l -c "mpirun -np 12 siesta" 2>&1 | tee siesta.log > "$BBM_JOB_DIR"/siesta.log

# 4. parse calculated results
gosh-adaptor siesta siesta.log
