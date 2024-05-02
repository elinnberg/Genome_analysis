#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2 #from manual
#SBATCH -t 20:00:00
#SBATCH -J eggnog_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

#change or remove the folowing (reservation) depending on when you run the script


module load bioinfo-tools
module load eggNOG-mapper/2.1.9

module load gffread/0.12.7

#genemark_durian is for my annotation that I did with the correct script.
gffread -E braker/Durian/augustus.hints.gff -o genemark_gff/genemark_durian.gff

# Use eggnogmapper for my fasta file i used for braker, as well as the genemark file.
# emapper.py -m diamond -i pilon_output.fasta.masked -i genemark_gff/genemark_durian.gff 
emapper.py -m diamond --itype CDS --translate -i pilon_output.fasta.masked -o eggnogresult --decorate_gff genemark_gff/genemark_durian.gff
