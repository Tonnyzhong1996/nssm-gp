#!/bin/bash
#SBATCH --time=0-1:0:0       # 1 day
#SBATCH --mem-per-cpu=2000   # 8G of memory
#SBATCH --cpus-per-task=8    # 8 cores for a task
#SBATCH --ntasks=1           # 1 tasks at a time
#SBATCH --nodes=1            # run all on same node
#SBATCH --array=1-12         # run for different q
#SBATCH --output=logs/mocap4_%a.log # name logs

n=$SLURM_ARRAY_TASK_ID                  # define n  
line=`sed "${n}q;d" params_mocap.txt`      # get n:th line (1-indexed) of the file 

export OMP_NUM_THREADS=8

sleep $n  # different time-based random seeds
sleep $n  # different time-based random seeds
srun -J mocap-$SLURM_ARRAY_TASK_ID python -u run-experiment.py $line