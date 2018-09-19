
# Create Output directory
working_dir=Illumina_Adapter_Removed

# Input director contains fastq
raw_data=Sample_reads

# Remove if the output is exist
rm -rf $working_dir

# Create the outout folder
mkdir $working_dir

ADAPTSEQ=Software/bbmap/resources

rm -rf $working_dir
mkdir -p $working_dir $working_dir/stats

cd $raw_data

ls *.fastq.gz > list.txt

while read R1
do read R2

echo "Processing $R1 $R2" 

../Software/bbmap/bbduk.sh -Xmx20g in1=$R1 in2=$R2 out1=../$working_dir/$R1 out2=../$working_dir/$R2 ref=../$ADAPTSEQ/nextera.fa.gz ktrim=r k=23 mink=11 hdist=1 tpe tbo overwrite=true stats=../$working_dir/stats/$R1.log
done< list.txt
