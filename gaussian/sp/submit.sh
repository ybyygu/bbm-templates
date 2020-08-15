#! /usr/bin/env bash
# change gaussian scratch directory to a safer location
export GAUSS_SCRDIR=$(pwd)

# remove old checkpoint file
rm Test.FChk 2>/dev/null

# call g09 and read input stream from stdin
g09 > gauss.log

# check if it is a normal termination
# write message to stderr
if [[ ! `grep 'Normal termination' gauss.log` ]]; then
    >&2 echo "Abnormal termination of g09!"
    cp gauss.log /tmp/
    >&2 echo "Please check g09 output for tails: /tmp/gauss.log"
    exit 12
fi

# call adaptor to extract results
gaussian-adaptor Test.FChk
