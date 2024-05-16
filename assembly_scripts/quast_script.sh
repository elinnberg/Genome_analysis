#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J elin_quast_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

#change or remove the folowing depending on when you run the script


# Load modules
module load bioinfo-tools
module load quast/5.0.2

# Your commands
# Test quality of the output from pilon
# Run QUAST
quast.py -o /home/elinb/Genome_analysis/quast_resut /home/elinb/Genome_analysis/pilon_output.fasta

