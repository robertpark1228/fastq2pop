#!/bin/bash
TRIMMOMATIC=./tools/Trimmomatic-0.35
ADAPTOR=./tools/Trimmomatic-0.35/adapters/adopater.fa


#for i in $(find ${SAMPLE_DIR} -maxdepth 1 -name "KPGP-00*");do
for i in $(cat ${1});do
#cd ${i}

if [ -f trimmomatic_${i} ];then
echo "Running"
else
touch trimmomatic_${i}
A=($(find -name "${i}*_R1_*.fq" | sed '{s/\.\///g}' | sort))
B=($(find -name "${i}*_R2_*.fq" | sed '{s/\.\///g}' | sort))

# For paired check. alpha
echo ${#A[*]}
echo ${#B[*]}


A_com=($(find -name "*_R1_*.gz" | sed '{s/\.\///g}' | sort))
B_com=($(find -name "*_R2_*.gz" | sed '{s/\.\///g}' | sort))

echo ${#A[*]}
echo ${#B[*]}


	if [ ${#A[*]} -ne 0 ];then
for j in $(seq 0 ${#A[*]});do
nohup java -jar -Xmx8000M ${TRIMMOMATIC} PE -threads 8 ${A[j]} ${B[j]} ${DIR}/${A[j]}.paired.fq ${DIR}/${A[j]}.unpaired.fq ${DIR}/${B[j]}.paired.fq ${DIR}/${B[j]}.unpaired.fq ILLUMINACLIP:${ADOPTOR}:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36 TOPHRED33 &
done

	elif [ ${#A_com[*]} -ne 0 ];then
for k in $(seq 0 ${#A_com[*]});do 
nohup java -jar -Xmx8000M ${TRIMMOMATIC} PE -threads 8 ${A_com[k]} ${B_com[k]} ${DIR}/${A_com[k]}.paired.fq.gz ${DIR}/${A_com[k]}.unpaired.fq.gz ${DIR}/${B_com[k]}.paired.fq.gz ${DIR}/${B_com[k]}.unpaired.fq.gz ILLUMINACLIP:${ADOPTOR}:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36 TOPHRED33 & 
done
	fi

fi;

echo "Wait process ID:" $(ps ef | grep "${A[0]}.unpaired.fq.gz" | awk '{ print $1 }' | head -n1)
wait $(ps ef | grep "${A[0]}.unpaired.fq.gz" | awk '{ print $1 }' | head -n1)
done

