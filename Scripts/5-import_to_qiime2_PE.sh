# Create Output directory
working_dir=Demux

# Input director contains fastq
raw_data=Primer-Filtered/fastq

# Remove if the output is exist
rm -rf $working_dir

# Create the outout folder
mkdir $working_dir



rm -rf $working_dir
mkdir $working_dir



qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path ../$raw_data \
  --source-format CasavaOneEightSingleLanePerSampleDirFmt \
  --output-path ../$working_dir/demux-paired-end.qza
