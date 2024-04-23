#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8 #from manual
#SBATCH -t 05:00:00
#SBATCH -J braker_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

#change or remove the folowing depending on when you run the script
#SBATCH --reservation=uppmax2024-2-7_7

chmod a+w -R /home/elinb/Genome_analysis/august_config/species/
cp -vf /sw/bioinfo/GeneMark/4.33-es/snowy/gm_key $HOME/.gm_key


# Set environment variables
export AUGUSTUS_CONFIG_PATH=/home/elinb/Genome_analysis/augustus_config
export AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin
export AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts
export GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy



# Load modules
module load bioinfo-tools
module load braker/2.1.1_Perl5.24.1
module load augustus/3.2.3_Perl5.24.1
module load bamtools/2.5.1
module load blast/2.9.0+
module load GenomeThreader/1.7.0
module load samtools/1.8
module load GeneMark/4.33-es_Perl5.24.1

#source $AUGUSTUS_CONFIG_COPY

# Run BRAKER with modifications
braker.pl --species=Durian --genome=/home/elinb/Genome_analysis/RM_63597.WedApr101426272024/pilon_output.fasta \
          --bam=/home/elinb/Genome_analysis/star_results/SRR6156069_scaffold_10Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results/SRR6156067_scaffold_10Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results/SRR6156066_scaffold_10Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results/SRR6040097_scaffold_10Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results/SRR6040096_scaffold_10Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results/SRR6040094Aligned.sortedByCoord.out.bam,/home/elinb/Genome_analysis/star_results/SRR6040093_scaffold_10Aligned.sortedByCoord.out.bam,/home/elinb/Genome_analysis/star_results/SRR6040092_scaffold_10Aligned.sortedByCoord.out.bam \
          --useexisting \
          --softmasking \
          --cores=8 \
	  --AUGUSTUS_CONFIG_PATH=/home/elinb/Genome_analysis/augustus_config \
	  --AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin \
          --AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts \
	  --GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy \

