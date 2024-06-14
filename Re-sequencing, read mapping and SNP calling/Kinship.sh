#install
conda install king

#convert format
plink --vcf ../autosome-1.recode.vcf --make-bed --out autosome

#kingship
king -b autosome.bed --kinship

#unrelated sample
king -b autosome.bed --unrelated
