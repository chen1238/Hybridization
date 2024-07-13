vcftools --vcf ../4pop.recode.vcf --weir-fst-pop CAS1.txt --weir-fst-pop CAS2.txt --fst-window-size 100000 --out CAS1-CAS2
vcftools --vcf ../4pop.recode.vcf --weir-fst-pop CAS1.txt --weir-fst-pop DOM.txt  --fst-window-size 100000 --out CAS1-DOM
vcftools --vcf ../4pop.recode.vcf --weir-fst-pop CAS1.txt --weir-fst-pop MUS.txt  --fst-window-size 100000 --out CAS1-MUS
vcftools --vcf ../4pop.recode.vcf --weir-fst-pop CAS2.txt --weir-fst-pop DOM.txt  --fst-window-size 100000 --out CAS2-DOM
vcftools --vcf ../4pop.recode.vcf --weir-fst-pop CAS2.txt --weir-fst-pop MUS.txt  --fst-window-size 100000 --out CAS2-MUS
vcftools --vcf ../4pop.recode.vcf --weir-fst-pop DOM.txt  --weir-fst-pop MUS.txt  --fst-window-size 100000 --out DOM-MUS


vcftools --vcf ../4pop.recode.vcf --keep CAS1.txt --window-pi 100000 --out CAS1
vcftools --vcf ../4pop.recode.vcf --keep CAS2.txt --window-pi 100000 --out CAS2
vcftools --vcf ../4pop.recode.vcf --keep DOM.txt  --window-pi 100000 --out DOM
vcftools --vcf ../4pop.recode.vcf --keep MUS.txt  --window-pi 100000 --out MUS

tar zcfv fst-pi.tar.gz *.fst *.pi
