vcftools --vcf ../Y.recode.vcf --keep 198-Y.txt --recode --out 198-Y

bgzip 198-Y.recode.vcf
tabix 198-Y.recode.vcf.gz

bcftools view -R region.txt 198-Y.recode.vcf.gz > Y.ancestral.vcf

plink --vcf Y.ancestral.vcf  --biallelic-only --recode vcf-iid --out Y.ancestral.bia

vcftools --vcf Y.ancestral.bia.vcf --recode --maf 0.05 --max-missing 1 --out Y.ancestral.final

python vcf2phylip.py -f -i Y.ancestral.final.recode.vcf --output-prefix Y.ancestral
