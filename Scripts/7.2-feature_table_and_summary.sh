# Create Output directory
working_dir=denoised-paired-view

# Input director contains fastq
input_demux=Denoised-paired

# Remove if the output is exist
rm -rf $working_dir

# Create the outout folder
mkdir $working_dir



qiime feature-table summarize \
  --i-table ../$input_dir/table-dada2.qza \
  --o-visualization $../working_dir/table.qzv \
  --m-sample-metadata-file ../$metadata_dir/meta_data.txt

qiime feature-table tabulate-seqs \
  --i-data ../$input_dir/rep-seqs-dada2.qza \
  --o-visualization ../$working_dir/rep-seqs.qzv
