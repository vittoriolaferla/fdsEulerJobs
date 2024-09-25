#!/bin/bash
#SBATCH -J firstExample
#SBATCH -e /cluster/home/vlaferla/fdsEulerJobs/0/firstExample.err
#SBATCH -o /cluster/home/vlaferla/fdsEulerJobs/0/firstExample.log
#SBATCH --partition=normal.24h
#SBATCH --ntasks=4
#SBATCH --nodes=2
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=2:0:0

export OMP_NUM_THREADS=1
cd $SLURM_SUBMIT_DIR

srun -N 2 -n 4 --ntasks-per-node=1 /cluster/home/vlaferla/FDS/FDS6/bin/fds firstJob.fds