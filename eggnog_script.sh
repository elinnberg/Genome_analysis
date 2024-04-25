#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8 #from manual
#SBATCH -t 05:00:00
#SBATCH -J eggnog_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user elinberg3@gmail.com
#SBATCH --output=%x.%j.out

#change or remove the folowing depending on when you run the script
#SBATCH --reservation=uppmax2024-2-7_8

module load bioinfo-tools
module load eggNOG-mapper/2.1.9
module load gffread/0.12.7

gffread -E braker/Durian/GeneMark-ET/genemark.gtf -o genemark_gff/genemark.gff
