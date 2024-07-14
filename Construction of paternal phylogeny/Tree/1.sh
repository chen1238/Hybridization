bcftools view -r Y:1-3400000  ../Y.recode.vcf.gz -Ov -o ./Yp.vcf

./vcf2phylip.py -i ./Yp.vcf -f

iqtree -s ./Yp.min4.fasta -pre Y -m MFP -B 1000
