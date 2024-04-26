#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8 #from manual
#SBATCH -t 03:00:00
#SBATCH -J braker_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools
module load gffread/0.12.7


# Use gffread to get the fasta file for the protein coding regions (in the file after w command)
gffread -w transcripts.fa -g genome.fa annotation.gff

gffread -w durian_transcripts.fa -g pilon_output.fasta.masked braker/Durian/augustus.hints.gff


