vcftools --vcf ../autosome.recode.vcf \
	--keep keep.txt --recode \
	--mac 1 --max-missing 0.9\
	--out ./4pop
	
