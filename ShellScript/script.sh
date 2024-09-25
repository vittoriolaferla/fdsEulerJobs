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
module load gcc/8.3.0        # Replace with available GCC module
module load openmpi/4.0.1    # Replace with available OpenMPI module
# module load any other modules required by FDS

export OMP_NUM_THREADS=1
cd $SLURM_SUBMIT_DIR

# Verify that the executable exists and is executable
if [ ! -x "/cluster/home/vlaferla/FDS/FDS6/bin/fds" ]; then
  echo "Executable not found or not executable" >&2
  exit 1
fi

# Run the application
srun -N 2 -n 4 --ntasks-per-node=2 /cluster/home/vlaferla/FDS/FDS6/bin/fds firstJob.fds
