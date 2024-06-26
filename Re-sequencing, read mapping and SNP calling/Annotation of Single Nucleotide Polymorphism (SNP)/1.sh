conda deactivate

vep -i ../../autosome-1.recode.vcf --fork 8 -o autosome.vep.vcf \
	--cache --cache_version 101 --assembly GRCm38 \
	--dir ~/.vep/ --offline --vcf \
	--species mus_musculus \
	--fasta ~/.vep/Mus_musculus.GRCm38.dna.primary_assembly.fa \
	--force_overwrite

vep -i ../../x-1.recode.vcf --fork 8 -o x.vep.vcf \
	--cache --cache_version 101 --assembly GRCm38 \
	--dir ~/.vep/ --offline --vcf \
	--species mus_musculus \
	--fasta ~/.vep/Mus_musculus.GRCm38.dna.primary_assembly.fa \
	--force_overwrite

