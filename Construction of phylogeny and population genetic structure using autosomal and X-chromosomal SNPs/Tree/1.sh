#all
mkdir all
../VCF2Dis-1.46/bin/VCF2Dis -InPut ../autosome.recode.vcf -OutPut ./all/auto


#4dtv
mkdir 4dtv intergenic synonymous
./calc_4DTv_eff_vcf.py ../../1.annotation_snp/snpeff/autosome.annotation.vcf ./4dtv/4dtv.vcf ../../1.annotation_snp/snpeff/snpEff_latest_core/snpEff/data/genomes/mm10.fa

../VCF2Dis-1.46/bin/VCF2Dis -InPut ./4dtv/4dtv.vcf  -OutPut ./4dtv/4dtv

#intergenic
awk '/^#/||/intergenic_region/' ../../1.annotation_snp/snpeff/autosome.annotation.vcf > ./intergenic/intergenic.vcf
../VCF2Dis-1.46/bin/VCF2Dis -InPut ./intergenic/intergenic.vcf -OutPut ./intergenic/intergenic


#synonymous
awk '/^#/||/synonymous_variant/' ../../1.annotation_snp/snpeff/autosome.annotation.vcf > ./synonymous/synonymous.vcf
../VCF2Dis-1.46/bin/VCF2Dis -InPut ./synonymous/synonymous.vcf -OutPut ./synonymous/synonymous


