#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 05:00:00
#SBATCH -J elin_star1_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

#change or remove the folowing depending on when you run the script
#SBATCH --reservation=uppmax2024-2-7_5

# Load modules
module load bioinfo-tools
module load star/2.7.11a

# Directory to the output from RepeatMasker
# /home/elinb/Genome_analysis/RM_63597.WedApr101426272024/pilon_output.fasta

STAR --runThreadN 8 \
     --runMode genomeGenerate \
     --genomeDir /home/elinb/Genome_analysis/genomeindex_4star \
     --genomeFastaFiles /home/elinb/Genome_analysis/RM_63597.WedApr101426272024/pilon_output.fasta \
