#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2 #from manual
#SBATCH -t 06:00:00
#SBATCH -J eggnognew
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

#change or remove the folowing (reservation) depending on when you run the script


module load bioinfo-tools
module load eggNOG-mapper/2.1.9

module load gffread/0.12.7


#gffread to create fasta file for emapper
gffread -w transcripts_foreggnog.fa -g pilon_output.fasta.masked braker_gff/braker/Durian/GeneMark-ET/genemark.gtf


# Use eggnogmapper for my fasta file i used for braker, as well as the genemark file.
# Will generate eggnogresult of the transcripts (not genes), however they have the same numbers. 
emapper.py -m diamond --itype CDS --translate -i transcripts_foreggnog.fa -o eggnogresult eggnogresult_final.emapper.annotations
