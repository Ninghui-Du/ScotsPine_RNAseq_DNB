#!/bin/bash

#SBATCH --output=/mnt/shared/scratch/ndu/pine_project/output/pinebiome_full.log
#SBATCH --cpus-per-task=2
#SBATCH --mem=4G
#SBATCH --partition=long

# RUN THE NEXTFLOW RNASEQ PIPELINE

# Activate conda environment
source activate nextflow

# Extend Singularity image pull timeout to prevent download failure
export NXF_SINGULARITY_PULL_TIMEOUT=72h

nextflow run nf-core/rnaseq -profile cropdiversityhpc \
                               	-resume \
				-process.shell bash \
				-c '/mnt/shared/scratch/ndu/pine_project/scripts/slurm2.config' \
				-r dev \
				--input '/mnt/shared/scratch/ndu/pine_project/data/samplesheet_full.csv' \
				--outdir '/mnt/shared/scratch/ndu/pine_project/output/full_output/' \
				--fasta '/mnt/shared/scratch/ndu/pine_project/genome/ptabuliformis.fa' \
				--gtf '/mnt/shared/scratch/ndu/pine_project/genome/P.tabuliformis_V1.0.gene.final.renamed.gtf' \
				--aligner 'star_salmon' \
				--remove_ribo_rna \
				--save_reference \
				--bam_csi_index \
				--skip_biotype_qc
# 
