#!/bin/bash
/hisat2-2.2.1/hisat2-build -p 20  T84-66_V2_Lachesis_assembly.fa T84-66_V2_Lachesis_assembly

hisat2 -x T84-66_V2_Lachesis_assembly -p 20 -1 Ld1_FRAS220073395-1r_1.clean.fq -2 Ld1_FRAS220073395-1r_2.clean.fq -S Ld1.sam

samtools view  -@ 4 -bS Ld1.sam >Ld1.bam 

samtools sort -@ 4 Ld1.bam Ld1.sort

stringtie -p 20 -e -G T84-66_V2_Chr_genome_final_gene.gff3 -o Ld1.gtf -l Ld1 Ld1.sort.bam

samtools index Ld1.sort.bam

samtools view -b -h Ld1.sort.bam AA_Chr10 > Ld1_AA_Chr10.bam

samtools index Ld1_AA_Chr10.bam
