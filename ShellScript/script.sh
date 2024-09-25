#!/bin/bash
#SBATCH -J firstExample
#SBATCH -e /cluster/home/vlaferla/fdsEulerJobs/0/firstExample.err
#SBATCH -o /cluster/home/vlaferla/fdsEulerJobs/0/firstExample.log
#SBATCH --partition=<name of queue>
#SBATCH --ntasks=4
#SBATCH --nodes=2
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=2:0:0
export OMP_NUM_THREADS=1
cd <pwd>
srun -N 2 -n 4 --ntasks-per-node 2 /cluster/home/vlaferla/fdsEulerJobs/0/\0\0.fds 