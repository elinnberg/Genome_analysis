#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 01:00:00
#SBATCH -J elin_RepeatMasker_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

#change or remove the folowing depending on when you run the script
#under sbatch n specify the number of cores from student manual

# Load modules
module load bioinfo-tools
module load RepeatMasker/4.1.5

# Assembly fine tuning, so sending in the improved assembly provided from pilon
RepeatMasker /home/elinb/Genome_analysis/pilon_output.fasta

