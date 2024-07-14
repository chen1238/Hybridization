vcftools --gzvcf ../Y.recode.vcf.gz --keep 198-Y.txt --recode --out 198-Y

bgzip 198-Y.recode.vcf
tabix 198-Y.recode.vcf.gz

bcftools view -R region.txt 198-Y.recode.vcf.gz > Y.ancestral.vcf

vcftools --vcf Y.ancestral.vcf --recode --maf 0.05 --max-missing 1 --out Y.ancestral.final

python vcf2phylip.py -f -i Y.ancestral.final.recode.vcf --output-prefix Y.ancestral
