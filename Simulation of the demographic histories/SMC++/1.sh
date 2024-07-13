#MASK
#seqkit locate -i -P -G -r -p "N+" grcm38.fa | sed 1d |cut -f 1,5,6 > mask.bed
#for i in {1..19};do awk '$1=='$i'' mask.bed > chr${i}.mask.bed ;done
#for i in {1..19};do bgzip chr${i}.mask.bed;tabix chr${i}.mask.bed.gz ;done


#VCF
vcftools --vcf ../autosome.recode.vcf --keep 2pop.txt --max-missing 0.9 --recode --out 2pop
bgzip 2pop.recode.vcf
tabix 2pop.recode.vcf.gz



for j in {1..19}
do
  sudo docker run --rm -v $PWD:/mnt terhorst/smcpp:latest vcf2smc ./2pop.recode.vcf.gz ./MUS/MUS-chr${j}.smc.gz $j MUS:CN1,CN8,CN10,GM2,GM9,CN24
done
sudo docker run --rm -v $PWD:/mnt terhorst/smcpp:latest estimate --spline cubic --knots 15 --timepoints 100 10000000 --cores 20  -o ./MUS/estimate/ 4.1e-9 ./MUS/MUS-*.smc.gz



for j in {1..19}
do
  sudo docker run --rm -v $PWD:/mnt terhorst/smcpp:latest vcf2smc  ./2pop.recode.vcf.gz ./CAS2/CAS2-chr${j}.smc.gz $j CAS2:CN6,CN7,GX15,GX14,GD15,GD7
done
sudo docker run --rm -v $PWD:/mnt terhorst/smcpp:latest estimate --spline cubic --knots 15 --timepoints 100 10000000 --cores 20  -o ./CAS2/estimate/ 4.1e-9 ./CAS2/CAS2-*.smc.gz



sudo docker run --rm -v $PWD:/mnt terhorst/smcpp:latest plot ./total.pdf ./*/estimate/*.final.json -g 0.5 --ylim 0 10000000 --xlim 100 1000000 -c
