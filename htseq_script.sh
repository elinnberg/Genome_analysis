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
module load htseq/2.0.2

#run it individually for all the alignments from STAR 
# if it doesnt work, try genemark : /home/elinb/Genome_analysis/braker/Durian/GeneMark-ET/genemark.gtf
#augustus.hints.gff is the gff file to use
htseq-count -f bam -s no star_results2/SRR6156069_scaffold_10.Aligned.sortedByCoord.out.bam braker/Durian/GeneMark-ET/genemark.gtf -o \
htseq_res/SRR6156069_scaffold_10_augustus
 

