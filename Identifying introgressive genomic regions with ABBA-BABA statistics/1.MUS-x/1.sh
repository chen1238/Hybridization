vcftools --vcf ../../../x.recode.vcf --max-missing 0.9 --keep keep.txt --recode --out mus

python ../VCF_processing/parseVCF.py -i mus.recode.vcf |bgzip > mus.geno.gz

python ../ABBABABAwindows.py -g ./mus.geno.gz -f phased -o mus.ABBA.csv -w 100000 -s 20000 -m 100 -T 10 -P1 m -P2 h -P3 c -O o --popsFile mus.txt --writeFailedWindows 

python ../popgenWindows.py -g ./mus.geno.gz -f phased -o mus.pop.csv -w 100000 -s 20000 -m 100 -T 10 -p m -p h -p c -p o --popsFile mus.txt --writeFailedWindows 


vcftools --vcf ./mus.recode.vcf --keep m.txt  --window-pi 100000 --window-pi-step 20000 --out ./fst-pi/m
vcftools --vcf ./mus.recode.vcf --keep h.txt  --window-pi 100000 --window-pi-step 20000 --out ./fst-pi/h

vcftools --vcf ./mus.recode.vcf --weir-fst-pop m.txt --weir-fst-pop h.txt --fst-window-size 100000 --fst-window-step 20000 --out ./fst-pi/h-m
vcftools --vcf ./mus.recode.vcf --weir-fst-pop c.txt --weir-fst-pop h.txt --fst-window-size 100000 --fst-window-step 20000 --out ./fst-pi/c-h
