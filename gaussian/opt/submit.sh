#! /usr/bin/env bash
# submit.sh

# read molecular stream from stdin
tee input.gjf | g09 > input.out 2> err.log

# call adaptor to extract results
gosh-adaptor gaussian Test.FChk
