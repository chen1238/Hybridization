for i in {1..7};do echo model$i >>rank.txt ;sed -n 1p ./model$i/rank.txt >> rank.txt;done
