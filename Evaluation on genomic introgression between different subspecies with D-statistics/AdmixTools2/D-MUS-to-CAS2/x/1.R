rm(list=ls())
library(admixtools)
library(tidyverse)

prefix='./data/CAS2'

#D(pop1,pop2,pop3,outgroup),BABA-ABBA
#pop2
CAS2=read.table('CAS2.txt')$V1
#pop3
MUS=read.table('MUS.txt')$V1
#pop1
Tar=read.table('T.txt')$V1
#outgroup
SPR='SP1'

a=f4(prefix,c(Tar,CAS2),CAS2,MUS,SPR,f4mode=FALSE)
write.csv(a,file='BABA-ABBA-C-D.csv',row.names=F)

