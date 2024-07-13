library(FastEPRR)

#step1
for(i in 1:5){
  FastEPRR_VCF_step1(vcfFilePath =paste0('./data/chr',i,'.recode.vcf.gz'), erStart = 2900001, erEnd = NULL, winLength = 100000, samConsidered = "all", srcOutputFilePath = paste0('./work/chr',i,'/step1/chr',i))
  #FastEPRR_VCF_step2(srcFolderPath = paste0('./work/chr',i,'/step1'),jobNumber = 1, currJob = 1,getCI = FALSE, DXOutputFolderPath = paste0('./work/chr',i,'/step2'))
  #FastEPRR_VCF_step3(srcFolderPath = paste0('./work/chr',i,'/step1'), DXFolderPath = paste0('./work/chr',i,'/step2'),finalOutputFolderPath = paste0('./work/chr',i,'/step3'))
}
for(i in 6:11){
  FastEPRR_VCF_step1(vcfFilePath =paste0('./data/chr',i,'.recode.vcf.gz'), erStart = 2900001, erEnd = NULL, winLength = 100000, samConsidered = "all", srcOutputFilePath = paste0('./work/chr',i,'/step1/chr',i))
  #FastEPRR_VCF_step2(srcFolderPath = paste0('./work/chr',i,'/step1'),jobNumber = 1, currJob = 1,getCI = FALSE, DXOutputFolderPath = paste0('./work/chr',i,'/step2'))
  #FastEPRR_VCF_step3(srcFolderPath = paste0('./work/chr',i,'/step1'), DXFolderPath = paste0('./work/chr',i,'/step2'),finalOutputFolderPath = paste0('./work/chr',i,'/step3'))
}
for(i in 12:19){
  FastEPRR_VCF_step1(vcfFilePath =paste0('./data/chr',i,'.recode.vcf.gz'), erStart = 2900001, erEnd = NULL, winLength = 100000, samConsidered = "all", srcOutputFilePath = paste0('./work/chr',i,'/step1/chr',i))
  #FastEPRR_VCF_step2(srcFolderPath = paste0('./work/chr',i,'/step1'),jobNumber = 1, currJob = 1,getCI = FALSE, DXOutputFolderPath = paste0('./work/chr',i,'/step2'))
  #FastEPRR_VCF_step3(srcFolderPath = paste0('./work/chr',i,'/step1'), DXFolderPath = paste0('./work/chr',i,'/step2'),finalOutputFolderPath = paste0('./work/chr',i,'/step3'))
}


#step2
for(i in 1:5){
  #FastEPRR_VCF_step1(vcfFilePath =paste0('./data/chr',i,'.recode.vcf.gz'), erStart = 2900001, erEnd = NULL, winLength = 100000, samConsidered = "all", srcOutputFilePath = paste0('./work/chr',i,'/step1/chr',i))
  FastEPRR_VCF_step2(srcFolderPath = paste0('./work/chr',i,'/step1'),jobNumber = 1, currJob = 1,getCI = FALSE, DXOutputFolderPath = paste0('./work/chr',i,'/step2'))
  #FastEPRR_VCF_step3(srcFolderPath = paste0('./work/chr',i,'/step1'), DXFolderPath = paste0('./work/chr',i,'/step2'),finalOutputFolderPath = paste0('./work/chr',i,'/step3'))
}
for(i in 6:11){
  #FastEPRR_VCF_step1(vcfFilePath =paste0('./data/chr',i,'.recode.vcf.gz'), erStart = 2900001, erEnd = NULL, winLength = 100000, samConsidered = "all", srcOutputFilePath = paste0('./work/chr',i,'/step1/chr',i))
  FastEPRR_VCF_step2(srcFolderPath = paste0('./work/chr',i,'/step1'),jobNumber = 1, currJob = 1,getCI = FALSE, DXOutputFolderPath = paste0('./work/chr',i,'/step2'))
  #FastEPRR_VCF_step3(srcFolderPath = paste0('./work/chr',i,'/step1'), DXFolderPath = paste0('./work/chr',i,'/step2'),finalOutputFolderPath = paste0('./work/chr',i,'/step3'))
}
for(i in 12:19){
  #FastEPRR_VCF_step1(vcfFilePath =paste0('./data/chr',i,'.recode.vcf.gz'), erStart = 2900001, erEnd = NULL, winLength = 100000, samConsidered = "all", srcOutputFilePath = paste0('./work/chr',i,'/step1/chr',i))
  FastEPRR_VCF_step2(srcFolderPath = paste0('./work/chr',i,'/step1'),jobNumber = 1, currJob = 1,getCI = FALSE, DXOutputFolderPath = paste0('./work/chr',i,'/step2'))
  #FastEPRR_VCF_step3(srcFolderPath = paste0('./work/chr',i,'/step1'), DXFolderPath = paste0('./work/chr',i,'/step2'),finalOutputFolderPath = paste0('./work/chr',i,'/step3'))
}


#step3
for(i in 1:5){
  #FastEPRR_VCF_step1(vcfFilePath =paste0('./data/chr',i,'.recode.vcf.gz'), erStart = 2900001, erEnd = NULL, winLength = 100000, samConsidered = "all", srcOutputFilePath = paste0('./work/chr',i,'/step1/chr',i))
  #FastEPRR_VCF_step2(srcFolderPath = paste0('./work/chr',i,'/step1'),jobNumber = 1, currJob = 1,getCI = FALSE, DXOutputFolderPath = paste0('./work/chr',i,'/step2'))
  FastEPRR_VCF_step3(srcFolderPath = paste0('./work/chr',i,'/step1'), DXFolderPath = paste0('./work/chr',i,'/step2'),finalOutputFolderPath = paste0('./work/chr',i,'/step3'))
}
for(i in 6:11){
  #FastEPRR_VCF_step1(vcfFilePath =paste0('./data/chr',i,'.recode.vcf.gz'), erStart = 2900001, erEnd = NULL, winLength = 100000, samConsidered = "all", srcOutputFilePath = paste0('./work/chr',i,'/step1/chr',i))
  #FastEPRR_VCF_step2(srcFolderPath = paste0('./work/chr',i,'/step1'),jobNumber = 1, currJob = 1,getCI = FALSE, DXOutputFolderPath = paste0('./work/chr',i,'/step2'))
  FastEPRR_VCF_step3(srcFolderPath = paste0('./work/chr',i,'/step1'), DXFolderPath = paste0('./work/chr',i,'/step2'),finalOutputFolderPath = paste0('./work/chr',i,'/step3'))
}
for(i in 12:19){
  #FastEPRR_VCF_step1(vcfFilePath =paste0('./data/chr',i,'.recode.vcf.gz'), erStart = 2900001, erEnd = NULL, winLength = 100000, samConsidered = "all", srcOutputFilePath = paste0('./work/chr',i,'/step1/chr',i))
  #FastEPRR_VCF_step2(srcFolderPath = paste0('./work/chr',i,'/step1'),jobNumber = 1, currJob = 1,getCI = FALSE, DXOutputFolderPath = paste0('./work/chr',i,'/step2'))
  FastEPRR_VCF_step3(srcFolderPath = paste0('./work/chr',i,'/step1'), DXFolderPath = paste0('./work/chr',i,'/step2'),finalOutputFolderPath = paste0('./work/chr',i,'/step3'))
}

