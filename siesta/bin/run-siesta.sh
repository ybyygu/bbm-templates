#! /usr/bin/bash -x

# module load intel18u4

#export KMP_AFFINITY=granularity=fine,compact
#export KMP_AFFINITY=granularity=fine,scatter

# Disable openmp threading. slightly faster or not?
export OMP_NUM_THREADS=1

# Note: https://scc.ustc.edu.cn/zlsc/tc4600/intel/2016.0.109/mpi/Reference_Manual/I_MPI_ADJUST_Family.htm
# SIESTA crashed:
#  Bad DM normalization: Qtot, Tr[D*S] =       1048.00000000       1048.01785019
#  Stopping Program from Node:    0
export I_MPI_ADJUST_REDUCE=3

# if siesta crashed, try to reduce mpi processes manually
# mpirun -np 14 siesta
mpirun siesta

# Below lines only work for CHESS system
# NP=$(($LSB_DJOB_NUMPROC / 2))
# mpirun -np $NP siesta

