
# Create Output directory
working_dir=Primer-Filtered

# Input director contains fastq
raw_data=Illumina_Adapter_Removed

# Remove if the output is exist
rm -rf $working_dir

# Create the outout folder
mkdir $working_dir


# Forward and Reverse Sequence Primers
tag5='GAGTGCCAGCMGCCGCGGTAA'

tag5_R='ACGGACTACHVGGGTWTCTAAT'




rm -rf $working_dir

mkdir $working_dir

mkdir $working_dir/fastq



cd $raw_data





ls *.fastq.gz > list.txt



while read R1

do read R2



echo "Working on $R1 $R2"

if [[$R1 == *.gz]]; then
gzip -d $R1
gzip -d $R2

else


A="$( echo $R1 | cut -d'_' -f1)"

B="$( echo $R1 | cut -d'_' -f2)"

out_name_R1=$A"_"$B"_L001_R1_001"

out_name_R2=$A"_"$B"_L001_R2_001"

echo $out_name_R1

cutadapt -g $tag5 -G $tag5_R -o ../$working_dir/$out_name_R1".fastq"  -p ../$working_dir/$out_name_R2".fastq" $R1  $R2 -j 28 -e 0.2



gzip ../$working_dir/$out_name_R1".fastq" 

gzip ../$working_dir/$out_name_R2".fastq"



mv ../$working_dir/*.gz ../$working_dir/fastq/
fi
done< list.txt



