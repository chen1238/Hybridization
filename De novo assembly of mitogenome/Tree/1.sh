mafft --auto ./temp/2g.fas > Mit.mafft.fasta

trimal -in Mit.mafft.fasta -out Mit.mafft.trimal.fasta -automated1

iqtree -s ./Mit.mafft.trimal.fasta -pre Mit -m MFP -B 1000
