PREFIX=autosome-1
for i in {1..100}
do
   mkdir run$i
   cp ${PREFIX}* ./run$i
   cd run$i
   ../fsc2705 -t ${PREFIX}.tpl -e ${PREFIX}.est -n 200000 -m -M -L 50 -s0 -0 -c10 -C 10
   cd ..
done
 
cat run{1..100}/autosome-1/autosome-1.bestlhoods > SH.txt
