mkdir data
vcftools --vcf ../../autosome.recode.vcf --max-missing 0.9 --mac 1 --keep keep.txt --recode --out MUS
plink --vcf MUS.recode.vcf --make-bed --allow-extra-chr --out ./data/MUS

Rscript 1.R
