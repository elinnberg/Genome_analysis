#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8 #from manual
#SBATCH -t 08:00:00
#SBATCH -J braker_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools
module load braker/2.1.1_Perl5.24.1
module load augustus/3.2.3_Perl5.24.1
module load bamtools/2.5.1
module load blast/2.9.0+
module load GenomeThreader/1.7.0
module load samtools/1.8
module load GeneMark/4.33-es_Perl5.24.1



#change or remove the folowing depending on when you run the script
source $AUGUSTUS_CONFIG_COPY
chmod a+w -R /home/elinb/Genome_analysis/august_config/species/
cp -vf /sw/bioinfo/GeneMark/4.33-es/snowy/gm_key $HOME/.gm_key


# Set environment variables
export AUGUSTUS_CONFIG_PATH=/home/elinb/Genome_analysis/augustus_config
export AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin
export AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts
export GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy


# Run BRAKER with modifications. As well as achnaging to the correct, mapped file as a refernce genome.
braker.pl --species=Durian --genome=/home/elinb/Genome_analysis/pilon_output.fasta.masked \
          --bam=/home/elinb/Genome_analysis/star_results2/SRR6156069_scaffold_10.Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results2/SRR6156067_scaffold_10.Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results2/SRR6156066_scaffold_10.Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results2/SRR6040097_scaffold_10.Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results2/SRR6040096_scaffold_10.Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results2/SRR6040094_scaffold_10.Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results2/SRR6040093_scaffold_10.Aligned.sortedByCoord.out.bam,\
/home/elinb/Genome_analysis/star_results2/SRR6040092_scaffold_10.Aligned.sortedByCoord.out.bam \
          --useexisting \
          --softmasking \
          --cores=8 \
	  --gff3 \
	  --AUGUSTUS_CONFIG_PATH=/home/elinb/Genome_analysis/augustus_config \
	  --AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin \
          --AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts \
	  --GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy \

