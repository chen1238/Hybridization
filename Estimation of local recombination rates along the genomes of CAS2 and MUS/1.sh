vcftools --gzvcf /media/rui/KESU/1.pass_vcf/BEAGLE/autosome.vcf.gz --keep CAS2.txt --recode --mac 1 --out CAS2

vcftools --gzvcf /media/rui/KESU/1.pass_vcf/BEAGLE/autosome.vcf.gz --keep MUS.txt --recode --mac 1 --out MUS


mkdir data
for i in {1..19}
do
  vcftools --vcf ./cas.recode.vcf --recode --chr $i --out ./data/chr$i
  bgzip ./data/chr$i.recode.vcf
  tabix ./data/chr$i.recode.vcf.gz
  mkdir -p ./work/chr$i/step1
  mkdir -p ./work/chr$i/step2
  mkdir -p ./work/chr$i/step3
done
