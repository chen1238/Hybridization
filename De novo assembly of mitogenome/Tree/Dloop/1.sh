cp ../Dloop-data/Dloop.fasta ./

mafft --auto Dloop.fasta > Dloop.mafft.fasta

trimal -in Dloop.mafft.fasta -out Dloop.mafft.trimal.fasta -automated1

iqtree -s Dloop.mafft.trimal.fasta -pre Dloop -m MFP -B 1000
