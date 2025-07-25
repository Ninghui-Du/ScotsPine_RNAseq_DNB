# ScotsPine_RNAseq_DNB
The repository contains the nf-core pipeline, differential expression analysis and annotation scripts for Scots pine (Pinus sylvestris) transcriptomic response to Dothistroma Needle Blight (DNB). 

The input files for nf-core pipeline, which contains:

i. Samplesheet_full.csv (RNA-seq sample information used in this study, RNA was extracted from each sample in this study and did paired-end sequencing using the Illumina WGS platform.)

ii. slurm2.config (The workflow configuration script specified a resource configuration file)

iii. ptabuliformis.fa (Comlpete genomic DNA sequence of P. tabuliformis in FASTA format). On GitHub, I just showed the example of ptabuliformis.fa.filepart with a txt format.

iv. P.tabuliformis_V1.0.gene.final.renamed.gtf (The annotation file of P. tabuliformis - exon locations, gene IDs, transcript structures). On GitHub, I just showed the example of gtf file example with a txt format.

The output files for nf-core pipeline, which contains:

i. salmon.merged.gene_counts.tsv (Including all gene counts for every samples)

The RNA-seq data were generated from Scots pine seedlings classified as either resistant/susceptible/average to DNB infection, sampled at two timepoints (tp2 and tp3) in natrual inoculation. Gene counts were quantified using the nf-core pipeline, and differential expression analysis was conducted using DEseq2. For this project, the count matrices were produced using Salmon and summarized at the gene level. Differential expression was analyzed separately for each timepoint to identify significant gene expression differences between resistant and susceptible groups.

The input files for DESeq2, which contains:

i. Metadata.csv (Including resistance classification based on DNB-AUDPS scores, growth traits, provenance information, family structure)

ii. salmon.merged.gene_counts.tsv (This file contains 48 samples and 7989 genes, each row represents a gene and each column represents a sample)

The output files for DESeq2, which contains:

i. deg2_tp2 (significant genes after tidyverse).csv and deg2_tp3 (significant genes after tidyverse).csv (These two files are about the significant expressed genes under the threshold of p-value < 0.05)

In order to find the potential biological functions of differentially expressed genes, functional analysis were performed for the DEGs identified at the tp2 and tp3. 

The input files for annotation, which contains:

i. deg2_tp2 (significant genes after tidyverse).csv and deg2_tp3 (significant genes after tidyverse).csv 

ii. P.tabuliformis_V1.0.Protein.fa (This file is the protein sequence database of Pinus tabuliformis, the usage of this file is to match the DEGs from Scots pine to homologous proteins in Pinus tabuliformis). On GitHub, I just showed the example of P.tabuliformis protein example with a FASTA format.)

iii. up_and_down_genes_tp2.csv (This file contains the DEGs with more stringent thershold (Under the threshold of p value < 0.05 and the absolute value of log2FoldChange > 1))

This is the same input for timepoint3.

The output files for annotation, which contais:

i. deg_tp2_proteins.fa (This file contains the DEGs'(Under the threshold of p < 0.05) homologous protein sequences for timepoint2.)

ii. selected_sequences.fasta (This file contains the DEGs'(Under more stringent threshold, like p < 0.05 and the absolute value of log2FoldChange > 1 ) homologous protein sequences that has upregulated or downregulated functions in timepoint3)

Repository Structure:

i. DEseq2_tp2.Rmd: A markdown file about DESeq2 at tp2.

ii. DEseq2_tp3.Rmd: A markdown file about DESeq2 at tp3.

iii. slurm2.config: SLURM job configuration for nf-core (This was written by Beth Moore). 

iv. run_rnaseq_nf2.sh: Bash script to submit the nf-core RNA-seq pipeline  (This was wrriten by Beth Moore).

v. Annotation_tp2.Rmd: Extract homologous protein sequences of DEGs at tp2.

vi. Annotation_tp3.Rmd: Extract homologous protein sequences of DEGs at tp3.
