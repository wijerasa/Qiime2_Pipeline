#making a directory for classifier
mkdir gg-13-8-99-515-806-nb-classifier
wget -O "gg-13-8-99-515-806-nb-classifier/gg-13-8-99-515-806-nb-classifier.qza" "https://data.qiime2.org/2017.11/common/gg-13-8-99-515-806-nb-classifier.qza"

working_dir=Taxonomic-analysis
classifier=gg-13-8-99-515-806-nb-classifier/gg-13-8-99-515-806-nb-classifier.qza
input_dir=Denoised-paired
input_dir_table=Denoised-paired
metadata_dir=$PWD


rm -rf $working_dir
mkdir $working_dir

qiime feature-classifier classify-sklearn \
  --i-classifier ../$classifier \
  --i-reads ../$input_dir/rep-seqs-dada2.qza \
  --o-classification ../$working_dir/taxonomy.qza

qiime metadata tabulate \
  --m-input-file ../$working_dir/taxonomy.qza \
  --o-visualization ../$working_dir/taxonomy.qzv


qiime taxa barplot \
  --i-table ../$input_dir_table/table-dada2.qza \
  --i-taxonomy ../$working_dir/taxonomy.qza \
  --m-metadata-file ../$metadata_dir/MappingFile_plate1_mod.txt \
  --o-visualization ../$working_dir/taxa-bar-plots.qzv