# fastq2pop

Fastq2pop is population analyzing pipeline script bundled with serise of softwares based on Illumina NGS short read sequencing data
V0.0.1


1) Easy Installation





2) Module Usage:


- vcf2pca_1kgp : Compare and plot 3D PCA for your whole exome or genome data with 26 population from 1KGP_phase3_data
Recommendation : Eigenstart, R 3d Plotting Package, Rscript, Python

- vcf2arlequin : Vaild only for biallelic snp and indel. Arlequin is one of the best tools for following population, ancestor.
We believe that best result can be obtained from chromosome Y. Whole chromomsome from 1 to 22 and X can be converted but we do not recommend on use them. It seems like linux based arlequin 3.5 is not supporting multi-threading, so calculation time is too long. I believ that If you have sufficient amount of time and resources, you can do so.

- vcf2gbrowser : Generating gbrowser compatible gff file. Data can be immediately stored on SQL with perl script db2XXXX.perl SNP,INDELs (Bi-allelic only) with annotated data.


3)


