#!/bin/bash
#SBATCH -J firstExample
#SBATCH -e /cluster/home/vlaferla/fdsEulerJobs/0/firstExample.err
#SBATCH -o /cluster/home/vlaferla/fdsEulerJobs/0/firstExample.log
#SBATCH --partition=normal.24h
#SBATCH --ntasks=4
#SBATCH --nodes=2
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=2:0:0

# Load necessary modules
module purge
module load gcc/9.3.0
module load openmpi/4.0.3

export OMP_NUM_THREADS=1
cd $SLURM_SUBMIT_DIR

# Ensure the executable exists and is executable
if [ ! -x "/cluster/home/vlaferla/fdsEulerJobs/0/firstJob.fds" ]; then
  echo "Executable not found or not executable"
  exit 1
fi

srun -N 2 -n 4 --ntasks-per-node=2 /cluster/home/vlaferla/fdsEulerJobs/0/firstJob.fds
