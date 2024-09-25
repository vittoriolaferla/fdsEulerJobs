#!/bin/bash
#SBATCH -J firstExample
#SBATCH -e /cluster/home/vlaferla/fdsEulerJobs/64/firstExample.err
#SBATCH -o /cluster/home/vlaferla/fdsEulerJobs/64/firstExample.log
#SBATCH --partition=bigmem.24h
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=2:0:0

# Define the timing output file
TIMING_FILE="/cluster/home/vlaferla/fdsEulerJobs/64/job_timing.log"

# Record the start time
echo "Job started at $(date)" > "$TIMING_FILE"
start_time=$(date +%s)

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
mpirun -np 1 /cluster/home/vlaferla/FDS/FDS6/bin/fds 64.fds

# Record the end time and calculate elapsed time
end_time=$(date +%s)
elapsed_time=$((end_time - start_time))
echo "Job ended at $(date)" >> "$TIMING_FILE"
echo "Elapsed time: $(date -ud "@$elapsed_time" +'%H hours %M minutes %S seconds')