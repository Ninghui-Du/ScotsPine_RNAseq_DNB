#!/bin/bash

#SBATCH --output= input-dir/pinebiome_full.log
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
				-c 'input-dir/slurm2.config' \
				-r dev \
				--input 'input-dir/samplesheet_full.csv' \
				--outdir 'output-dir/full_output/' \
				--fasta 'input-dir/ptabuliformis.fa' \
				--gtf 'input-dir/P.tabuliformis_V1.0.gene.final.renamed.gtf' \
				--aligner 'star_salmon' \
				--remove_ribo_rna \
				--save_reference \
				--bam_csi_index \
				--skip_biotype_qc
# 
