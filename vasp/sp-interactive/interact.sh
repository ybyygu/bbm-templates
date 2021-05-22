#! /bin/bash

sleep 1
# resume vasp
echo resume vasp >/dev/stderr
pkill -u $USER -SIGCONT vasp
vasp-client -vvv -u $(realpath vasp.sock)
# pause vasp
echo pause vasp >/dev/stderr
pkill -u $USER -SIGSTOP vasp
