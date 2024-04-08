#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:20:00
#SBATCH -J elin_job1
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out
# Load modules
module load bioinfo-tools
module load FastQC/0.11.9
# Your commands
fastqc /home/elinb/Genome_analysis/Raw_Data/4_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_10.1P.fastq.gz -o /home/elinb/Genome_analysis

