# Create Output directory
working_dir=Denoised-paired

# Input director contains fastq
input_demux=Demux

# Remove if the output is exist
rm -rf $working_dir

# Create the outout folder
mkdir $working_dir



qiime dada2 denoise-paired \
  --i-demultiplexed-seqs ../$input_demux/demux-paired-end.qza \
  --p-trunc-len-f 250 \
  --p-trunc-len-r 250 \
  --o-representative-sequences ../$working_dir/rep-seqs-dada2.qza \
  --o-table ../$working_dir/table-dada2.qza \
  --p-n-threads 8 \
  --p-max-ee 2 \
  --p-trunc-q  2
