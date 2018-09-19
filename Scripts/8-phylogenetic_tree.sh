working_dir=Phylogenetic-diversity
input_dir=Denoised-paired

rm -rf ../$working_dir
mkdir ../$working_dir

cd $input_dir

qiime alignment mafft \
  --i-sequences ../$input_dir/rep-seqs-dada2.qza \
  --o-alignment ../$working_dir/aligned-rep-seqs.qza

qiime alignment mask \
  --i-alignment ../$working_dir/aligned-rep-seqs.qza \
  --o-masked-alignment ../$working_dir/masked-aligned-rep-seqs.qza

qiime phylogeny fasttree \
  --i-alignment ../$working_dir/masked-aligned-rep-seqs.qza \
  --o-tree ../$working_dir/unrooted-tree.qza

qiime phylogeny midpoint-root \
  --i-tree ../$working_dir/unrooted-tree.qza \
  --o-rooted-tree ../$working_dir/rooted-tree.qza
