#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2 #from manual
#SBATCH -t 05:00:00
#SBATCH -J htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

#change or remove the folowing (reservation) depending on when you run the script


module load bioinfo-tools
module load samtools/1.20

#Command to create the indexes, change for every alignment (they are already sorted which is great for htseq later)
samtools index star_results2/SRR6040092_scaffold_10.Aligned.sortedByCoord.out.bam
