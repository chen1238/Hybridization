conda install eigensoft

vcftools --vcf ../autosome-1.recode.vcf --maf 0.01 --recode --max-missing 0.9 --out autosome

conda activate py27

python ./vcf2eigenstrat.py -v ./autosome.recode.vcf -o autosome

smartpca -p runningpca.conf.txt


