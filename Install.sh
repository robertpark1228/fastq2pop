#!/bin/bash
# folder arrangement
# VALUE(Workload balancing): WORKS <= CORE 
# INSTALL.sh [Jobs] [pair1_file_list] [pari2_file_list]

#Folder/Regex
MAIN=${PWD}
re='^[0-9]+$'

#Variable
while getopts "j:pa:pb:" arg
do
	case $arg in
		j)	jobs=$OPTARG
			;;
		pa)	pair_1=$OPTARG
			;;
		pb)	pair_2=$OPTARG
			;;
		?)	echo "Wrong Argument"
			exit 1
			;;
	esac
done


#help/usage

if [ $# -eq 0 ]
then    
	echo "Install.sh -j [Jobs] -pa [Fullpath:pair1_file_list] -pb [pair2_file_list]"
	echo "Install.sh -j 4 -pa pair1.file -pb pair2.file"
fi


if ! [[ ${jobs} =~ $re ]] ; then
echo "Error : Job number is not defined" >&2; exit 1
fi 

if ! [[ -f ${pair_1} ]] ; then
echo "Error : file1 is not exist" >&2; exit 1
fi

if ! [[ -f ${pair_2} ]] ; then
echo "Error : file2 is not exist" >&2; exit 1
fi






#DB_INSTALLATION
##if



#Creating main script
cat > fastq2pop.sh  << fastq_folder_db_init
#!/bin/bash
##folder
MAIN_PWD=${MAIN}
pair1=${pair_1}
pair2=${pair_2}

while getopts "t:a:g:p:d:r:l:" arg
do
	case $arg in
		t)	f_gtf=$OPTARG
			;;
		a)	geneanno=$OPTARG
			;;
		g)	genome=$OPTARG
			;;
		p)	prefix=$OPTARG
			;;
		d)	dir=$OPTARG
			;;
		r)	path=$OPTARG
			;;
		l)	neargene=$OPTARG
			;;
		?)	echo "ERROR"
			exit 1
			;;
	esac
done

if [ $# -eq 0 ] 
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
#bash ${MAIN}/fastq_to_bam/trimmo.sh ${pair1} ${pair2} ${core}

}







fastq_folder_db_init

