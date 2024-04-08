#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:10:00
#SBATCH -J elin_bwa_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

#change or remove the folowing depending on when you run the script
#SBATCH --reservation=uppmax2024-2-7_3

# Load modules
module load bioinfo-tools
module load Pilon/1.24

# Your commands
# Align Flye output to the BWA output (reference genome towards bwa_aligned.sorted.bam)
java -jar pilon.jar --genome /home/elinb/Genome_analysis/assembly.fasta --bam bwa_aligned.sorted.bam --output /home/elinb/Genome_analysis/pilon_output
