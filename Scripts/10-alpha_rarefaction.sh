working_dir=Alpha-rarefaction
input_dir=Phylogenetic-diversity
input_dir_table=Denoised-paired
metadata_dir=$PWD

rm -rf ../$working_dir
mkdir -p ../$working_dir

cd $input_dir

qiime diversity alpha-rarefaction \
  --i-table ../$input_dir_table/table-dada2.qza \
  --i-phylogeny ../$input_dir/rooted-tree.qza \
  --p-max-depth 500 \
  --m-metadata-file ../meta_data_rmd.txt \
  --o-visualization ../$working_dir/alpha-rarefaction.qzv

#qiime tools view  $working_dir/alpha-rarefaction.qzv
