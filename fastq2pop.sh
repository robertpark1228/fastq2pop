#!/bin/bash
##folder
MAIN_PWD=/BiO/ycparkworking/a.sample/unrelated/PP_MODULE/fastq2pop
pair1=
pair2=

while getopts "t:a:g:p:d:r:l:" arg
do
	case ? in
		t)	f_gtf=
			;;
		a)	geneanno=
			;;
		g)	genome=
			;;
		p)	prefix=
			;;
		d)	dir=
			;;
		r)	path=
			;;
		l)	neargene=
			;;
		?)	echo "ERROR"
			exit 1
			;;
	esac
done

if [ 2 -eq 0 ] 
then
	echo "usage : shell -t 基因注释文件是否为gtf格式[y/n]"
	echo "              -a 基因注释文件"
	echo "              -g 基因组文件"
	echo "              -d 变异检测结果文件夹"
	echo "              -p 生成文件前缀"
	echo "              -r 保存变异注释结果的文件夹名称"
	echo "              -l 基因上下游距离[1000]"
	exit 1
fi 

module1(){
#bash /BiO/ycparkworking/a.sample/unrelated/PP_MODULE/fastq2pop/fastq_to_bam/trimmo.sh   

}







