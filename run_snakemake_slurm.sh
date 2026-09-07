#!/bin/bash

# SBATCH directives for Slurm job submission of Snakemake workflow
# Usage: sbatch run_snakemake_slurm.sh

# export path shortcut for the repo and run directories
export REPO="/home/$USER/deepmut_variant_analysis/gyoza"
export RUN="/scratch/alpine/$USER/deepmut_variant_analysis/gyoza/toy"

#SBATCH --job-name=snakemake
#SBATCH --account=YOUR_ALLOCATION
#SBATCH --partition=acpu
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --output=$RUN/logs/smk-%j.out
#SBATCH --error=$RUN/logs/smk-%j.err

# Load modules and activate the conda environment
module load slurm/alpine
module load miniforge
mamba activate snakemake

# Run Snakemake with the specified profile and directory
snakemake \
  --profile profiles/slurm/ \
  --directory $RUN \
  --rerun-incomplete