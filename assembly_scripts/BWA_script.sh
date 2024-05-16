#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J elin_bwa_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools
module load bwa/0.7.17
module load samtools/1.19
# Your commands
bwa index /home/elinb/Genome_analysis/assembly.fasta
bwa mem /home/elinb/Genome_analysis/assembly.fasta /home/elinb/Genome_analysis/Raw_Data/4_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_10.1P.fastq.gz /home/elinb/Genome_analysis/Raw_Data/4_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_10.2P.fastq.gz > /home/elinb/Genome_analysis/bwa_alignments.sam
samtools view -bS bwa_alignments.sam > bwa_alignments.bam
samtools sort -o bwa_alignments.sorted.bam bwa_alignments.bam
samtools index bwa_alignments.sorted.bam

