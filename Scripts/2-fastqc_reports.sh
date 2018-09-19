
# Create Output directory
working_dir=Fastqc_Report

# Input director contains fastq
raw_data=Sample_reads

# Remove if the output is exist
rm -rf $working_dir

# Create the outout folder
mkdir $working_dir



cd $raw_data

ls *.fastq.gz > list.txt

while read R1

do read R2

echo "Woring $R1 $R2" 

fastqc $R1 $R2 -o ../$working_dir -t 8

done< list.txt




multiqc ../$working_dir/*.zip -o ../$working_dir/
