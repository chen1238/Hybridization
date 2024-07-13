seqkit grep -f keep.txt ../temp/2g.fas >  Mit.fasta

mafft --auto Mit.fasta > Mit.mafft.fasta

trimal -in Mit.mafft.fasta -out Mit.mafft.trimal.fasta -automated1

iqtree -s ./Mit.mafft.trimal.fasta -pre 4pop -m MFP -B 1000
