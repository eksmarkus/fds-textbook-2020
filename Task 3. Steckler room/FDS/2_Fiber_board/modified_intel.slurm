#!/bin/sh
# -N num - number of compute nodes
#SBATCH -N 1
# number of mpi processes per node
#SBATCH --ntasks-per-node=4
# number of cores per mpi process
#SBATCH --cpus-per-task=1
# job name
#SBATCH -J S300
# timelimit
#SBATCH -t 0-12

#set enviroment for fds

export OMPI_MCA_btl_openib_allow_ib=1
export OMPI_MCA_btl_openib_if_include="mlx5_0:1"

module load mpi/impi/2019.4.243
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

#run fds
mpiexec --bind-to none ~/firemodels/fds/Build/impi_intel_linux_64/fds_impi_intel_linux_64_htm_input_outflow_inflow Steckler.fds
