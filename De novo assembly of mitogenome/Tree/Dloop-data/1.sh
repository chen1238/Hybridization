seqkit grep -f keep.txt ../temp/2g.fas > 350.fasta

cat Dloop.fa 350.fasta > 351.fasta

mafft --auto 351.fasta > 351.mafft.fasta

seqkit subseq -r 15426:16303 351.mafft.fasta  > Dloop.mafft.fa

seqkit grep -f keep.txt Dloop.mafft.fa > Dloop.350.fa

mv Dloop.350.fa Dloop.fasta
