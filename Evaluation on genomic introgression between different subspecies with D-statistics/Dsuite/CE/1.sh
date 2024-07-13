vcftools --vcf ../../../autosome.recode.vcf --recode --keep ce.txt --max-missing 0.9 --mac 1 --out ce
../Dsuite-master/Build/Dsuite Dtrios ./ce.recode.vcf pop.txt
