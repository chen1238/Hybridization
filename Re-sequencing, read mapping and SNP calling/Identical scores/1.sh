#1.convert vcf to 2brad.
./vcf_2brad_reformat.pl -i 349.recode.vcf  -o 349.xls

#separate:
mkdir chr identical_score
for i in {1..19} ; do awk '$1=='$i' || $1=="Ref_ID"{print$0}' 349.xls > ./chr/chr$i.xls ; done

#operate
for i in {1..19} ;do perl get_identical_score.pl  -i  ./chr/chr$i.xls -c chr.tab -g group1.list -w 1000000 -s 1000000 -o ./identical_score/$i.xls ;done


#selected vcf file
vcftools --vcf ../x-1.recode.vcf --recode --mac 3 --max-missing 0.9 --out x

#1.convert vcf to 2brad.
./vcf_2brad_reformat.pl -i x.recode.vcf  -o ./chr/chrX.xls

#operate
perl get_identical_score.pl  -i  ./chr/chrX.xls -c chr-x.tab -g group1.list -w 1000000 -s 1000000 -o ./identical_score/X.xls

#
#rename
for i in {1..19} X;do mv ./identical_score/$i.xls  ./identical_score/$i.txt ;done

