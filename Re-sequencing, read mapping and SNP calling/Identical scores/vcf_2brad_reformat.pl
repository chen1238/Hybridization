#!/usr/bin/perl
#2019.11.4
use strict;
use warnings;
use Getopt::Long;

my ($vcf,$iibrad);
GetOptions(
	"i:s" => \$vcf,
	"o:s" => \$iibrad
);
unless($vcf && $iibrad){
	print STDERR "
	Description
		Reformat the vcf to 2brad file
	perl $0 -i file.vcf -o file_2brad.xls
	\n";
	exit();
}

open IN,"<",$vcf or die "Cannot open $vcf\n";
open OUT,">",$iibrad or die "Cannot open $iibrad\n";
while(<IN>){
	chomp;
	next if(/^##/);
	my @tmp=split /\s+/,$_;
	if(/^#CHROM/){
		print OUT "Ref_ID\tRef_Seq\tLoc\tRef_Base\t";
		print OUT join("\t",@tmp[9..$#tmp])."\n";
	}else{
		#print OUT "$tmp[0]-0\t";
		print OUT "$tmp[0]\t";
		print OUT "N" x 27 ;
		print OUT "\t$tmp[1]\t$tmp[3]";
		my @array_base=($tmp[3],split(/,/,$tmp[4]));
		foreach my $i (@tmp[9..$#tmp]){
			my @record=split /:/,$i;
			my @numbers=split /\//,$record[0];
			if($numbers[0] =~ /\./){
				print OUT "\t--";
			}else{
				print OUT "\t$array_base[$numbers[0]]$array_base[$numbers[1]]";
			}
		}
		print OUT "\n";
	}
}
close IN;
close OUT;
