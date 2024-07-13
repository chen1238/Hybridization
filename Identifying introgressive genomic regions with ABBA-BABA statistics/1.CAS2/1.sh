vcftools --vcf ../../../autosome.recode.vcf --keep keep.txt --max-missing 0.9 --recode --out cas

python ../VCF_processing/parseVCF.py -i cas.recode.vcf |bgzip > cas.geno.gz

python ../ABBABABAwindows.py -g ./cas.geno.gz -f phased -o cas.ABBA.csv -w 100000 -s 20000 -m 100 -T 10 -P1 c -P2 h -P3 m -O o --popsFile cas.txt --writeFailedWindows 

python ../popgenWindows.py -g ./cas.geno.gz -f phased -o cas.pop.csv -w 100000 -s 20000 -m 100 -T 10 -p c -p h -p m -p o --popsFile cas.txt --writeFailedWindows 



vcftools --vcf ./cas.recode.vcf --keep c.txt  --window-pi 100000 --window-pi-step 20000 --out ./fst-pi/c
vcftools --vcf ./cas.recode.vcf --keep h.txt  --window-pi 100000 --window-pi-step 20000 --out ./fst-pi/h


vcftools --vcf ./cas.recode.vcf --weir-fst-pop m.txt --weir-fst-pop h.txt --fst-window-size 100000 --fst-window-step 20000 --out ./fst-pi/h-m
vcftools --vcf ./cas.recode.vcf --weir-fst-pop c.txt --weir-fst-pop h.txt --fst-window-size 100000 --fst-window-step 20000 --out ./fst-pi/c-h
