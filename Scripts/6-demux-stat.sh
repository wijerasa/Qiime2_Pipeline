
# Create Output directory
working_dir=demux-stat

# Input director contains fastq
raw_data=Demux

# Remove if the output is exist
rm -rf $working_dir

# Create the outout folder
mkdir $working_dir



qiime demux summarize \
  --i-data ../$raw_data/demux-paired-end.qza \
  --o-visualization ../$working_dir/demux-paired-end-stat.qzv
