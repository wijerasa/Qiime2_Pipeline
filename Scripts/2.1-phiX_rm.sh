module load BBTools
working_dir=/home/wilson3472/Working_dir/Data/Kim_Qiime2_folder/All_Plates/Phix-removed
raw_data=/home/wilson3472/Working_dir/Data/Kim_Qiime2_folder/Raw_Data/Merged_Plates
ADAPTSEQ=/export/NFS/Saranga/Software/bbmap/resources/

rm -rf $working_dir
mkdir $working_dir

cd $raw_data

ls *.fastq.gz > $raw_data/list.txt

while read R1
do read R2

echo "Woring $R1 $R2" 

bbduk.sh -Xmx20g in1=$R1 in2=$R2 out1=$working_dir/$R1 out2=$working_dir/$R2 ref=$ADAPTSEQ/phix174_ill.ref.fa.gz  k=31  hdist=1
done< $raw_data/list.txt
