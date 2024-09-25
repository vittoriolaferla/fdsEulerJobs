#!/bin/bash
#SBATCH -J firstExample
#SBATCH -e /cluster/home/vlaferla/fdsEulerJobs/0/firstExample.err
#SBATCH -o /cluster/home/vlaferla/fdsEulerJobs/0/firstExample.log
#SBATCH --partition=normal.24h
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=2:0:0

export OMP_NUM_THREADS=1
export LD_LIBRARY_PATH=/cluster/home/vlaferla/FDS/FDS6/bin/INTEL/lib:$LD_LIBRARY_PATH
export PATH=/cluster/home/vlaferla/FDS/FDS6/bin/INTEL/bin:$PATH
cd $SLURM_SUBMIT_DIR

# Verify that the executable exists and is executable
if [ ! -x "/cluster/home/vlaferla/FDS/FDS6/bin/fds" ]; then
  echo "Executable not found or not executable" >&2
  exit 1
fi

# Run the application using mpirun
mpirun -np 1 /cluster/home/vlaferla/FDS/FDS6/bin/fds firstJob.fds