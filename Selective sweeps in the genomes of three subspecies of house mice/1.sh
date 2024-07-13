conda install -c bioconda xpclr

vcftools --vcf ../autosome-recode.vcf --recode --keep in-cc.txt --max-missing 0.9 --mac 1 --out in-cc

bgzip in-cc.recode.vcf
tabix in-cc.recode.vcf.gz

for i in {1..19}
do 
    vcftools --gzvcf in-cc.recode.vcf.gz --chr $i --recode --out in-cc-$i
    bgzip in-cc-${i}.recode.vcf
    tabix in-cc-${i}.recode.vcf.gz
done


for i in {1..19}
do 
    xpclr --out ./in-cc-${i} -I ./in-cc-${i}.recode.vcf.gz -Sa ./in.txt -Sb ./cc.txt --ld 0.95 -C ${i} --maxsnps 600 --minsnps 100 --size 100000 --step 20000 
done
