mkdir data
vcftools --vcf ../../../x.recode.vcf --max-missing 0.9 --mac 1 --keep keep.txt --recode --out MUS
 
bcftools annotate --rename-chrs chr.txt ./MUS.recode.vcf -Ov -o MUS.vcf
plink --vcf MUS.vcf --make-bed --allow-extra-chr --out ./data/MUS

Rscript 1.R


