mkdir data
vcftools --vcf ../../autosome.recode.vcf --max-missing 0.9 --mac 1 --keep keep.txt --recode --out CAS2
plink --vcf CAS2.recode.vcf --make-bed --allow-extra-chr --out ./data/CAS2

Rscript 1.R
