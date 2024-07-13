conda install -c bioconda admixture

plink --vcf ../PCA/autosome.recode.vcf --make-bed --out autosome


for k in {1..6}
do 
    admixture --cv ./autosome.bed $k -j10 | tee log-${k}.out
done

bcftools query -l ../autosome.recode.vcf

cat *.log |grep CV > CV.txt
