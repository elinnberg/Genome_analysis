#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2 #from manual
#SBATCH -t 05:00:00
#SBATCH -J htseq_gm
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

#change or remove the folowing (reservation) depending on when you run the script

module load bioinfo-tools
module load htseq/2.0.2


# All the samples in star_results2 that are to be mapped
#SRR6040092_scaffold_10.Aligned.sortedByCoord.out.bam      SRR6040097_scaffold_10.Aligned.sortedByCoord.out.bam
#SRR6040093_scaffold_10.Aligned.sortedByCoord.out.bam      SRR6156066_scaffold_10.Aligned.sortedByCoord.out.bam
#SRR6040094_scaffold_10.Aligned.sortedByCoord.out.bam      SRR6156067_scaffold_10.Aligned.sortedByCoord.out.bam
#SRR6040096_scaffold_10.Aligned.sortedByCoord.out.bam      SRR6156069_scaffold_10.Aligned.sortedByCoord.out.bam


#run it individually for all the alignments from STAR 
#augustus.hints.gff is the gff file to use. However, htseq refuses to take the augustus file produced. Therefore genemark is used instead
#GeneMark-ET/genemark.gtf, this one worked with the program

htseq-count -f bam star_results2/SRR6040092_scaffold_10.Aligned.sortedByCoord.out.bam \
/home/elinb/Genome_analysis/braker_gff/braker/Durian/GeneMark-ET/genemark.gtf > \
htseq_results/SRR6040092_scaffold_10

 

