#需要注意的是PSMC适用于随机交配的二倍体物种，且只适用于2万年-300万年之间的Ne估计，更短或更长均会导致准确性降低，且重测序数据的深度不低于18×
samtools faidx mm10.fa


#step1.生成psmc的输入文件
bcftools mpileup -C 50 -Ou -I -f mm10.fa ./xxx.sort.rmdup.bam --threads 16 | bcftools call -c -Ov --threads 16 | ./vcfutils.pl vcf2fq -d 10 -D 100 | gzip > dilpoid.fq.gz

#./vcfutils.pl在https://github.com/lh3/samtools/tree/master/bcftools
# -C50 用于降低比对质量的系数，如果reads中含有过多的错配,默认为0，samtools使用书推荐50，设不设定对i结果影响还挺大,网上教程大多设置为50。
#-d    样本平均深度的三分之一
#-D    二倍的平均深度，深度较低则设置100
#./vcfutils.pl 是bcftools下载包中的工具
#--threads 线程数


#step2.转格式
../psmc-master/utils/fq2psmcfa -q20 dilpoid.fq.gz > output.psmcfa


#step3.1.单次PSMC
../psmc-master/psmc -N25 -t15 -r5 -p "4+25*2+4+6" -o output.psmc output.psmcfa
#-t：maximum 2N0 coalescent time; 2N0的最大世代时间，代表the upper limit of the TMRCA。
#-r: initial theta/rho ratio; 起始θ/ρ率
#-N：maximum number of iterations；迭代的最大次数


#step3.2.boostrap重复抽样运行
../psmc-master/utils/splitfa output.psmcfa > split.psmcfa
for i in {1..100}
do 
	../psmc-master/psmc -b -p "4+25*2+4+6" -t15 -N25 -r5 -o round${i}.psmc split.psmcfa
done
#-b参数表示bootstrap抽样做psmc，重复100次。估计服务器运算能力，可以10个重复作为一批。
#psmc结果合并,单次和boostrap合并
cat output.psmc round*.psmc >combine.psmc


##9 作图
#sudo apt install gnuplot-x11
#sudo apt-get install texlive-font-utils
perl ../psmc/psmc-master/utils/psmc_plot.pl -u 4.1e-9 -g 0.5 -R -p out_plot combine.psmc

#-u 物种每代碱基突变速率
#-R 产生中间文件，用于R绘制
#-g 生活史中的世代时间(每代的时间)，比如人设为为25年/代，一年生草本设置为1年/代，一年两代则为0.5年/代，世代设置越长，估计的有效群体时间越大。years=(代数 x g)
#结果中第一列为years，第二列为Ne(1e4)为单位

