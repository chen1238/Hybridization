seqkit grep -f keep.txt ../Dloop.fasta >  Dloop.fasta

mafft --auto Dloop.fasta > Dloop.mafft.fasta

trimal -in Dloop.mafft.fasta -out Dloop.mafft.trimal.fasta -automated1

iqtree -s ./Dloop.mafft.trimal.fasta -pre 4pop -m MFP -B 1000

