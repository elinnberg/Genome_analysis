#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8 #from manual
#SBATCH -t 05:00:00
#SBATCH -J elin_star2_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

#change or remove the folowing depending on when you run the script
#SBATCH --reservation=uppmax2024-2-7_6


# Load modules
module load bioinfo-tools
module load star/2.7.11a

# Set up STAR parameters-path to 16 files here, specifying scaffold 10
#/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156069_scaffold_10.2.fastq.gz"

# You run the STAR program with the forward and reverse strand for every sample in the trimmed directory. which will result in a new BAm file for every sample
# Run STAR alignment.
# For every rum, the outfilename prefix and the sample codes are changes, to account for a 8 pairs.

STAR --genomeDir /home/elinb/Genome_analysis/genomeindex_4star \ # Path to the directory containing the indexed reference genome \
     --readFilesCommand zcat --readFilesIn /home/elinb/Genome_analysis/Raw_Data/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156069_scaffold_10.1.fastq.gz \
/home/elinb/Genome_analysis/Raw_Data/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156069_scaffold_10.2.fastq.gz \
     --runThreadN $SLURM_NTASKS \
     --outSAMtype BAM SortedByCoordinate \
     --outFileNamePrefix /home/elinb/Genome_analysis/star_results/SRR6156069_scaffold_10

