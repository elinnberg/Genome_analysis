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
#SBATCH --reservation=uppmax2024-2-7_5

# Load modules
module load bioinfo-tools
module load star/2.7.11a

# Set up STAR parameters-path to 16 files here, specifying scaffold 10
read1="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156069_scaffold_10.2.fastq.gz"
read12="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156069_scaffold_10.1.fastq.gz"
read2="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156067_scaffold_10.2.fastq.gz"
read22="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156067_scaffold_10.1.fastq.gz"
read3="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156066_scaffold_10.2.fastq.gz"
read32="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156066_scaffold_10.1.fastq.gz"
read4="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040097_scaffold_10.2.fastq.gz"
read42="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040097_scaffold_10.1.fastq.gz"
read5="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040096_scaffold_10.2.fastq.gz"
read52="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040096_scaffold_10.1.fastq.gz"
read6="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040094_scaffold_10.2.fastq.gz"
read62="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040094_scaffold_10.1.fastq.gz"
read7="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040093_scaffold_10.2.fastq.gz"
read72="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040093_scaffold_10.1.fastq.gz"
read8="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040092_scaffold_10.2.fastq.gz"
read82="/home/elinb/Genome_Analysis/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040092_scaffold_10.1.fastq.gz"


# Run STAR alignment
STAR --genomeDir /home/elinb/Genome_analysis/genomeindex_4star \ # Path to the directory containing the indexed reference genome
     --readFilesIn $read1 $read12 $read2 $read22 $read3 $read32 $read4 $read42 $read5 $read52 $read6 $read62 $read7 $read72 $read8 $read82 \
     --runThreadN $SLURM_NTASKS \
     --outSAMtype BAM SortedByCoordinate \
     --outFileNamePrefix /home/elinb/Genome_analysis/star_results/mapped_reads_



