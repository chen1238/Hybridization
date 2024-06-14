#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;
use List::Util qw(max);

my ($input,$chrTable,$groupFile,$winSize,$stepSize,$output);
GetOptions(
	"i:s" => \$input,
	"c:s" => \$chrTable,
	"g:s" => \$groupFile,
	"w:s" => \$winSize,
	"s:s" => \$stepSize,
	"o:s" => \$output
);

unless($input && $chrTable && $groupFile && $output){
	print STDERR "
	Description
		Calculate the identical score of every samples
	Usage
		perl $0 -i snp.xls -c chr.tab -g group.list -w 1000000 -s 1000000 -o identical_score.xls
	Parameters
		-i: Input file, the snp.xls in 2b-rad
		-c: Table of chromosome ID and number
		-g: Group table
		-w: Window size
		-s: Step size
		-o: Output
	\n";
	exit;
}
$winSize ||=1000000;
$stepSize ||=1000000;
my %hash_group;
my %hash_chr;
my %hash_geno;

open CHR,"<",$chrTable or die "Cannot open $chrTable\n";
while(<CHR>){
	chomp;
	next unless($_);
	my @tmp=split /\s+/,$_;
	$hash_chr{$tmp[1]}=$tmp[0];
}
close CHR;

open GROUP,"<",$groupFile or die "Cannot open $groupFile\n";
while(<GROUP>){
	chomp;
	my @tmp=split /\s+/,$_;
	$hash_group{$tmp[0]}{$tmp[1]}=1;
}
close GROUP;

my @array_pos2sam;
my %hash_ref;
open IN,"<",$input or die "Cannot open $input\n";
while(<IN>){
	chomp;
	my @tmp=split /\s+/,$_;
	if(/^Ref_ID/){
		@array_pos2sam=@tmp[4..$#tmp];
	}else{
		my ($chr,$tagPos)=split /-/,$tmp[0];
		my $snpPos=$tagPos+$tmp[2]-1;
		$hash_ref{$chr}{$snpPos}=$tmp[3];
		for(my $i=4;$i<=$#tmp;$i++){
			my $sample=$array_pos2sam[$i-4];
			$hash_geno{$chr}{$snpPos}{$sample}=$tmp[$i];
		}
	}
}
close IN;

open OUT,">",$output or die "Cannot open $output\n";
print OUT "Chr\tStart\tEnd";
my @array_sample;
foreach my $group (keys %hash_group){
	foreach my $sample (sort {$a cmp $b} keys %{$hash_group{$group}}){
		print OUT "\t$sample";
		push @array_sample,$sample;
	}
}
print OUT "\n";

foreach my $chr (sort{$hash_chr{$a} <=> $hash_chr{$b}} keys %hash_chr){
	my $len=max(keys %{$hash_geno{$chr}});
	my $start=1;
	for(my $i=$start;$i<=$len;$i+=$stepSize){
		my $end=$i+$winSize-1;
		print OUT "$hash_chr{$chr}\t$i\t$end";
		my $snpNum=0;
		my %hash_score;
		foreach my $snp (sort{$a <=> $b} keys %{$hash_geno{$chr}}){
			if($snp>=$i && $snp <$i+$winSize){
				$snpNum+=2;
				foreach my $sample (@array_sample){
					my @array_geno=split //,$hash_geno{$chr}{$snp}{$sample};
					foreach my $base (@array_geno){
						if($base eq "-"){
							$hash_score{$sample}{"miss"}++;
						}elsif($base eq $hash_ref{$chr}{$snp}){
							$hash_score{$sample}{"score"}++;
						}
					}
				}
				#delete %{$hash_geno{$chr}{$snp}};
			}
		}
		foreach my $group (keys %hash_group){
			foreach my $sample (sort {$a cmp $b} keys %{$hash_group{$group}}){
				unless(exists $hash_score{$sample}{"miss"}){
					$hash_score{$sample}{"miss"}=0;
				}
				unless(exists $hash_score{$sample}{"score"}){
					$hash_score{$sample}{"score"}=0;
				}

				if($snpNum == 0){
					print OUT "\tNA";
				}elsif($snpNum == $hash_score{$sample}{"miss"}){
					print OUT "\tNA";
				}else{
					my $score= $hash_score{$sample}{"score"}/($snpNum-$hash_score{$sample}{"miss"});
					printf OUT "\t%.5f",$score;
				}
			}
		}
		%hash_score=();
		print OUT "\n";
	}
}
close OUT;
