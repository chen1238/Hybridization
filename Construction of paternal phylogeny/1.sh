vcftools --vcf Y.vcf --recode --max-missing 0.9 --mac 3 --minDP 3 --min-meanDP 3 --max-alleles 2 --min-alleles 2 --minQ 20 --out Y

bgzip Y.recode.vcf
tabix Y.recode.vcf.gz

