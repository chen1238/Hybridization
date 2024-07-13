rm(list=ls())
library(admixtools)
library(tidyverse)

prefix='./data/MUS'

#D(pop1,pop2,pop3,outgroup),BABA-ABBA
#pop1
Tar=read.table('T.txt')$V1
#pop2
MUS=read.table('MUS.txt')$V1
#pop3
DOM=read.table('DOM.txt')$V1
#outgroup
SPR='SP1'

a=f4(prefix,c(Tar,MUS),MUS,DOM,SPR,f4mode=FALSE)
write.csv(a,file='BABA-ABBA-M-D.csv',row.names=F)

