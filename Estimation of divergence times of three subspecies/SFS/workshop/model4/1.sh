PREFIX=autosome
for i in {1..50}
do
   mkdir run$i
   cp ${PREFIX}* ./run$i
   cd run$i
   ../fsc2705 -t ${PREFIX}.tpl -e ${PREFIX}.est -n 200000 -m -M -L 50 -s0 -0 -c10 -C 10
   cd ..
done
 
cat run{1..20}/autosome/autosome.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$8}' | sort -k 2 >rank.txt
