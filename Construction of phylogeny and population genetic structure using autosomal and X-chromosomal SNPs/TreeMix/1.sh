#vcf prefix
File=treemix

#clust file
clust=population.txt

#remove missing
vcftools --vcf ../autosome.recode.vcf --max-missing 1 --keep KEEP.txt  --recode --out ${File}
bgzip ${File}.recode.vcf

#LD filter,50 10 0.1
#chmod +x ./ldPruning.sh
./ldPruning.sh ${File}.recode.vcf.gz

#convert to treemix format file
conda activate py27
./vcf2treemix.sh ${File}.recode.LDpruned.vcf.gz $clust
conda deactivate

#run treemix
mkdir result
for i in {0..10}
do
    for j in {1..5}
    do
        treemix -i ./treemix.recode.LDpruned.treemix.frq.gz -m $i -o ./result/${File}-$i-$j -noss -bootstrap -k 500 -root SPR
    done
done



