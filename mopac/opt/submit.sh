#! /usr/bin/env bash
source /share/apps/mopac/env.rc

# read molecular stream from stdin, redirect it to geom_end.gen
cat > mopac.mop
mopac mopac.mop 2> err.log

# call adaptor to extract results
gosh-adaptor mopac mopac.out -a
