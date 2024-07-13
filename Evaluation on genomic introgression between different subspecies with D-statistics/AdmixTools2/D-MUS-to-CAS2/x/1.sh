mkdir data
vcftools --vcf ../../../x.recode.vcf --max-missing 0.9 --mac 1 --keep keep.txt --recode --out CAS2

bcftools annotate --rename-chrs chr.txt ./CAS2.recode.vcf -Ov -o CAS2.vcf
plink --vcf CAS2.vcf --make-bed --allow-extra-chr --out ./data/CAS2

Rscript 1.R


