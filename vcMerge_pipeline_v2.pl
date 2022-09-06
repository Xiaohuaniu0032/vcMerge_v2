use strict;
use warnings;
use File::Basename;
use Getopt::Long;
use FindBin qw/$Bin/;

my ($report_dir,$outdir) = @ARGV;


# TVC插件目录
my $vc_dirs_aref = &get_vc_dir_by_run_time($report_dir);

# 循环每个目录
for my $dir (@{$vc_dirs_aref}){
	my $vc_dir = "$report_dir/plugin_out/$dir";
	my @vcf = glob "$vc_dir/*/alleles.xls";

	my %sample_vars; # 记录特定样本的变异
	my %all_vars;    # 记录这个run下所有样本的变异
	my %sample;      # 样本名称(barcode编号)

	for my $vcf (@vcf){
		my $base_dir = dirname($vcf);
		my $barcode = basename($base_dir); # IonXpress_001
		$sample{$barcode} = 1;

		open VCF, "$vcf" or die;
		<VCF>; # skip header line
		while (<VCF>){
			chomp;
			next if /^$/;
			my @arr = split /\t/;

			my $chr = $arr[0];
			my $pos = $arr[1];
			my $ref = $arr[2];
			my $alt = $arr[3];
			my $gt = $arr[4]; # Homozygous / Heterozygous
			my $freq = $arr[6];
			my $qual = $arr[7];
			my $ori_cov = $arr[18]; # Original Coverage

			next if ($arr[4] ne "Homozygous" and $arr[4] ne "Heterozygous");
			
			my $var = "$arr[0]\:$arr[1]\:$arr[2]\:$arr[3]"; # 2019-nCoV:210:G:T
			$sample_vars{$barcode}{$var} = "$freq\ | $ori_cov";
			push @{$all_vars{$pos}}, $var; # 1) one pos may has diff variants; 2) may contain dup vars
		}
		close VCF;
	}
			

	my $outfile = "$outdir/$dir\.TSVC_variants.merged.vcf.xls";
	print "[Merge VCF is]: $outfile\n";
	
	open O, ">$outfile" or die;
	print O "Chrom\tPosition\tRef\tVariant";

	my @barcode = keys %sample;
	my @barcode_sort = sort {$a cmp $b} @barcode;

	for my $s (@barcode_sort){
		print O "\t$s";
	}
	print O "\n";

	# sort variant by pos
	foreach my $pos (sort { $a <=> $b } keys %all_vars){
		my $var_aref = $all_vars{$pos}; # one pos may have multi var type
		my %uniq_var;
		for my $var (@{$var_aref}){
			$uniq_var{$var} = 1;
		}

		for my $var (keys %uniq_var){ # 2019-nCoV:210:G:T
			my @var = split /\:/, $var;
			print O "$var[0]\t$var[1]\t$var[2]\t$var[3]";
			# 按样本顺序输出频率和深度信息
			for my $s (@barcode_sort){
				my $freq;
				if (exists $sample_vars{$s}{$var}){
					$freq = $sample_vars{$s}{$var};
				}else{
					$freq = "NA";
				}
				print O "\t$freq";
			}
			print O "\n";
		}
	}
	close O;
}



sub get_vc_dir_by_run_time{
	my ($dir) = @_; # /results/analysis/output/Home/GH002-20070043-88-guocan_S5-20220817-chip1_531
	# variantCaller插件可能运行多次,得到这个run所有的tvc插件结果
	my @startplugin_json = glob "$dir/plugin_out/*/startplugin.json"; # /results/analysis/output/Home/2019-nCoV-map2hg19-exon-virus_241/plugin_out/variantCaller_out.1257/startplugin.json
	my @vc_dirs;
	for my $json (@startplugin_json){
		my $basedir = dirname($json); # /results/analysis/output/Home/GH002-20070043-88-guocan_S5-20220817-chip1_531/plugin_out/variantCaller58_out.1955
		my $vc_name = basename($basedir); # variantCaller58_out.1955
		if ($vc_name =~ /^variantCaller_out/){
			push @vc_dirs, $vc_name;
		}
	}

	return(\@vc_dirs);
}
