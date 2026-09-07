#!/bin/bash

#SBATCH --job-name=snakemake
#SBATCH --ntasks=1
#SBATCH --qos=cpu-normal
#SBATCH -p acpu
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --output=/scratch/alpine/%u/deepmut_variant_analysis/gyoza/toy/logs/smk-%j.out
#SBATCH --error=/scratch/alpine/%u/deepmut_variant_analysis/gyoza/toy/logs/smk-%j.err

# export path shortcut for the repo and run directories
export REPO=/home/$USER/deepmut_variant_analysis/gyoza
export RUN=/scratch/alpine/$USER/deepmut_variant_analysis/gyoza/toy

# Load modules and activate the conda environment
module load slurm/alpine
module load miniforge
mamba activate snakemake

# Run Snakemake with the specified profile and directory
snakemake \
  --profile "$REPO/profiles/slurm" \
  --directory $RUN \
  --rerun-incomplete