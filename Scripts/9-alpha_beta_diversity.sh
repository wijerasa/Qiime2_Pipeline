working_dir=Alpha-Beta-diversity
input_dir=Phylogenetic-diversity
input_dir_table=Denoised-paired
metadata_dir=$PWD
echo "TESt $metadata_dir"

rm -rf ../$working_dir
mkdir -p ../$working_dir

cd ../$input_dir

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny ../$input_dir/rooted-tree.qza \
  --i-table ../$input_dir_table/table-dada2.qza \
  --p-sampling-depth 500 \
  --m-metadata-file ../$metadata_dir/meta_data.txt \
  --output-dir ../$working_dir/core-metrics-results



qiime diversity alpha-group-significance \
  --i-alpha-diversity ../$working_dir/core-metrics-results/faith_pd_vector.qza \
  --m-metadata-file ../$metadata_dir/meta_data_rmd.txt \
  --o-visualization ../$working_dir/core-metrics-results/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity ../$working_dir/core-metrics-results/evenness_vector.qza \
  --m-metadata-file ../$metadata_dir/meta_data_rmd.txt \
  --o-visualization ../$working_dir/core-metrics-results/evenness-group-significance.qzv

qiime diversity beta-group-significance \
  --i-distance-matrix ../$working_dir/core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file ../$metadata_dir/meta_data_rmd.txt \
  --m-metadata-category Treatment \
  --o-visualization ../$working_dir/core-metrics-results/unweighted-unifrac-treatment-significance.qzv \
  --p-pairwise

qiime diversity beta-group-significance \
  --i-distance-matrix ../$working_dir/core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file ../$metadata_dir/meta_data_rmd.txt \
  --m-metadata-category Time \
  --o-visualization ../$working_dir/core-metrics-results/unweighted-unifrac-time-group-significance.qzv \
  --p-pairwise


qiime diversity beta-group-significance \
  --i-distance-matrix ../$working_dir/core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file ../$metadata_dir/meta_data_rmd.txt \
  --m-metadata-category Section \
  --o-visualization ../$working_dir/core-metrics-results/unweighted-unifrac-section-group-significance.qzv \
  --p-pairwise
