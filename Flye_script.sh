#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 06:20:00
#SBATCH -J elin_fly1
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out
# Load modules
module load bioinfo-tools
module load Flye/2.9.1
# Your commands
flye --pacbio-raw /home/elinb/Genome_analysis/Raw_Data/4_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_10.fq.gz -o /home/elinb/Genome_analysis --threads 4

