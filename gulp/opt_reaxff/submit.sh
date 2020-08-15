#! /usr/bin/env bash
source /share/apps/gulp/env.rc

# read molecular stream from stdin, redirect it to geom_end.gen
echo @model_properties_format_version 0.1
echo @energy
gulp 2> err.log | tee gulp.log | grep "Final energy ="|awk '{print $4}'
echo @structure
# skip first two lines
tail -n +3 final.xyz
