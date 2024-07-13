for i in {1..7};do cp calculateAIC.sh ./model$i ;cd model$i;Rscript calculateAIC.sh autosome;cd ..;done

for i in {1..7}
do 
  echo model$i >> AIC.txt
  cat ./model$i/autosome.AIC >> AIC.txt
done

