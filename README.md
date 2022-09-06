# vcMerge

### 旧版variantCallerMerge已经不用

### 插件目的
如果一张芯片上了多个新冠样本，为了检查哪些突变是共检出，哪些突变是只有少数样本检出，需要肉眼比较不同样本的VCF文件，比较耗时。

本插件的目的是合并一个报告内的多个样本的新冠变异检测结果，方便比较变异检测结果。

### 插件过程

1) 确定`/results/analysis/output/Home/<Report>/plugin_out/`目录下哪些目录是变异检测`*variantCaller*`相关的目录。变异检测有2个插件：`variantCaller_out.1619/`和`SARS_CoV_2_variantCaller_out.1529/`。其他插件目录不会统计。

2）如果这个目录是variantCaller目录，检查这个目录下所有样本的`alleles.xls`，如果`alleles.xls`文件是新冠的vcf文件（根据文件第一列Chrom是否为`2019-nCoV`判断。

3）合并这个目录下的所有新冠样本的alleles.xls文件，输出文件名为`variantCaller_out.1257.TSVC_variants.merged.vcf.xls`或者`SARS_CoV_2_variantCaller_out.1529.TSVC_variants.merged.vcf.xls`。

### 输出文件格式
```
Chrom	Position	Ref	Variant	IonXpress_001	IonXpress_003	IonXpress_004	IonXpress_005	IonXpress_006
2019-nCoV	210	G	T	1	1	1	NA	NA
2019-nCoV	241	C	T	0.997494	0.997481	0.997494	NA	NA
2019-nCoV	362	G	A	1	0.997481	1	NA	NA
2019-nCoV	592	T	TGGTTT	NA	NA	NA	NA	NA
2019-nCoV	891	GTA	TTG	NA	NA	NA	NA	NA
2019-nCoV	3037	C	T	1	1	1	NA	NA
2019-nCoV	3261	C	T	NA	NA	NA	NA	NA
2019-nCoV	4181	G	T	1	0.997494	0.997487	NA	NA
2019-nCoV	5173	C	T	NA	NA	NA	NA	NA
2019-nCoV	5759	C	G	NA	NA	NA	NA	NA
2019-nCoV	6402	C	T	0.9275	0.9375	0.9	NA	NA
2019-nCoV	6651	C	T	NA	NA	NA	NA	NA
2019-nCoV	6865	G	T	1	1	1	NA	NA
2019-nCoV	6968	C	T	NA	NA	NA	NA	NA
2019-nCoV	6996	T	G	NA	NA	NA	NA	1
2019-nCoV	7124	C	T	1	0.997494	0.9975	NA	NA
2019-nCoV	7376	C	G	NA	NA	NA	NA	NA
2019-nCoV	8249	G	A	NA	NA	NA	NA	NA
2019-nCoV	8782	C	T	NA	NA	NA	NA	NA
2019-nCoV	8986	C	T	1	1	1	NA	NA
2019-nCoV	9051	CAG	CAT,CTAT	NA	NA	1,0	NA	NA
2019-nCoV	9053	G	T	1	1	NA	NA	NA
2019-nCoV	9314	GT	G	NA	NA	NA	NA	NA
2019-nCoV	9482	G	A	NA	NA	NA	NA	NA
2019-nCoV	9485	T	A	NA	NA	NA	NA	NA
2019-nCoV	9699	T	C	NA	NA	NA	NA	NA
2019-nCoV	9732	T	G	NA	NA	NA	NA	NA
2019-nCoV	10029	C	T	0.9975	0.997494	1	NA	NA
2019-nCoV	11201	A	G	1	1	1	NA	NA
2019-nCoV	11221	G	A	NA	NA	NA	NA	NA
2019-nCoV	11332	A	G	1	1	1	NA	NA
2019-nCoV	11868	C	T	NA	NA	NA	NA	NA
2019-nCoV	13170	C	A	NA	NA	NA	NA	NA
2019-nCoV	13837	C	A	NA	NA	NA	NA	NA
2019-nCoV	14340	C	A	NA	NA	NA	NA	1
2019-nCoV	14408	C	T	0.95	0.9725	0.8975	NA	NA
2019-nCoV	14838	C	T	NA	NA	NA	NA	NA
2019-nCoV	14925	C	T	1	1	0.9975	NA	NA
2019-nCoV	15166	TT	AA	NA	NA	NA	NA	NA
2019-nCoV	15451	G	A	0.9975	1	1	NA	NA
2019-nCoV	15760	G	A	NA	NA	NA	NA	NA
2019-nCoV	15984	A	T	NA	NA	NA	NA	NA
2019-nCoV	16466	C	T	0.9975	1	1	NA	NA
2019-nCoV	17520	T	C	NA	NA	NA	0.321429	NA
2019-nCoV	18091	T	TTATACC	NA	NA	NA	NA	NA
2019-nCoV	18522	A	G	1	1	1	NA	NA
2019-nCoV	18765	T	A	NA	NA	NA	NA	NA
2019-nCoV	18832	G	A	1	1	1	NA	NA
2019-nCoV	19102	C	A	NA	NA	NA	NA	NA
2019-nCoV	19220	C	T	1	0.997487	1	NA	NA
2019-nCoV	19245	C	T	NA	NA	NA	NA	NA
2019-nCoV	20946	C	T	NA	NA	NA	NA	NA
2019-nCoV	21008	C	T	NA	NA	NA	NA	0.9675
2019-nCoV	21137	A	G	1	1	1	NA	NA
2019-nCoV	21267	A	G	0.9875	0.99	0.9925	NA	NA
2019-nCoV	21328	ATGC	AAT	NA	NA	NA	NA	NA
2019-nCoV	21345	AT	A	NA	NA	NA	NA	NA
2019-nCoV	21618	C	G	1	1	1	NA	NA
2019-nCoV	21742	C	T	1	0.9975	0.985	NA	NA
2019-nCoV	21846	C	T	0.9875	1	1	NA	NA
2019-nCoV	21987	G	A	1	1	NA	NA	NA
2019-nCoV	22028	GAGTTCA	G	1	1	1	NA	NA
2019-nCoV	22096	C	T	1	1	1	NA	NA
2019-nCoV	22530	C	T	NA	NA	NA	NA	NA
2019-nCoV	22917	T	G	1	1	1	NA	NA
2019-nCoV	22995	C	A	0.9975	1	0.9975	NA	NA
2019-nCoV	23018	TTTAATTGTTAC	T	NA	NA	NA	NA	NA
2019-nCoV	23403	A	G	1	1	0.997494	NA	NA
2019-nCoV	23604	C	G	1	0.997494	0.997481	NA	NA
2019-nCoV	24034	C	T	NA	NA	NA	NA	NA
2019-nCoV	24110	A	C	0.997475	0.997487	1	NA	NA
2019-nCoV	24410	G	A	1	1	0.9975	NA	NA
2019-nCoV	25439	A	C	1	1	1	NA	NA
2019-nCoV	25469	C	T	1	1	1	NA	NA
2019-nCoV	25545	ACTTCTTGCTGTTTTTCAGAGCGCTTCCAAAATCATAACCCTCAAAAAGAGATGGCAACTAGCACT	A	NA	NA	NA	NA	NA
2019-nCoV	25724	T	C	NA	NA	NA	NA	NA
2019-nCoV	26395	C	A	NA	NA	NA	NA	NA
2019-nCoV	26438	T	A	NA	NA	NA	NA	NA
2019-nCoV	26729	T	C	NA	NA	NA	NA	NA
2019-nCoV	26767	T	C	1	1	1	NA	NA
2019-nCoV	27514	G	C	1	1	1	NA	NA
2019-nCoV	27635	C	T	NA	NA	NA	NA	0.215539
2019-nCoV	27638	T	C	0.9925	1	1	NA	NA
2019-nCoV	27656	T	A	NA	NA	NA	NA	NA
2019-nCoV	27752	C	T	1	1	1	NA	NA
2019-nCoV	27874	C	T	1	1	1	NA	NA
2019-nCoV	28077	G	C	NA	NA	NA	NA	NA
2019-nCoV	28144	T	C	NA	NA	NA	NA	NA
2019-nCoV	28178	G	T	NA	NA	NA	1	1
2019-nCoV	28247	AGATTTC	A	1	1	1	NA	NA
2019-nCoV	28270	TA	T	1	1	1	NA	NA
2019-nCoV	28461	A	G	1	1	1	NA	NA
2019-nCoV	28472	C	T	NA	NA	NA	NA	NA
2019-nCoV	28841	A	G	NA	NA	NA	1	0.9975
2019-nCoV	28878	G	A	NA	NA	NA	NA	NA
2019-nCoV	28881	G	T	0.997494	1	0.992443	NA	NA
2019-nCoV	28881	GGG	AAC	NA	NA	NA	NA	NA
2019-nCoV	28916	G	T	0.9925	0.997468	0.9975	NA	NA
2019-nCoV	29227	G	T	NA	NA	NA	NA	NA
2019-nCoV	29402	G	T	1	1	1	NA	NA
2019-nCoV	29420	C	T	1	1	1	NA	NA
2019-nCoV	29665	T	A	NA	NA	NA	NA	NA
2019-nCoV	29742	G	T	1	1	1	NA	NA
2019-nCoV	29742	G	A	NA	NA	NA	NA	NA
```
> 对于一个变异位点，如果该样本未检测到，则频率为NA。



### 结果下载

> 点击蓝色链接下载即可。xls格式。

![variantCallerMerge](https://github.com/Xiaohuaniu0032/vcMerge/blob/main/variantCallerMerge.png)


### 插件安装

1) 压缩`vcMerge`目录为`.zip`文件：`zip -r vcMerge.zip vcMerge -x \*.git\*`
2) 在TS页面上传`.zip`文件进行安装：TS页面右上角小齿轮->Plugins->Install or Upgrade Plugin -> Selete File -> Upload and Install