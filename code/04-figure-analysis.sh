#!/bin/bash

## visualize data for easier interpretation

qiime taxa barplot \
    --i-table data/dada2/combined-sets/table.qza \
    --i-taxonomy data/classify-results/taxonomy.qza \
    --m-metadata-file data/metadata/sample-metadata.tsv \
    --o-visualization data/classify-results/taxa-barplot.qzv

unzip data/classify-results/taxa-barplot.qzv -d data/classify-results/barplot_view

## open data/classify-results/barplot_view/db956e99-7971-4b64-a780-5b42e5fdbe6a/data/index.html with "live server" extension to visualize HTML
## select taxonomic level 2, take screenshot and upload to plots/

## create alpha and beta outputs

qiime phylogeny align-to-tree-mafft-fasttree \
    --i-sequences data/dada2/combined-sets/rep-seqs.qza \
    --o-alignment data/dada2/aligned-rep-seqs.qza \
    --o-masked-alignment data/dada2/masked-aligned-rep-seqs.qza \
    --o-tree data/dada2/unrooted-tree.qza \
    --o-rooted-tree data/dada2/rooted-tree.qza

## pick sampling depth

qiime diversity core-metrics-phylogenetic \
    --i-phylogeny data/dada2/rooted-tree.qza \
    --i-table data/dada2/combined-sets/table.qza \
    --p-sampling-depth 3000 \
    --m-metadata-file data/metadata/sample-metadata.tsv \
    --output-dir data/diversity

## create alpha plots

qiime diversity alpha-group-significance \
 --i-alpha-diversity data/diversity/shannon_vector.qza \
 --m-metadata-file data/metadata/sample-metadata.tsv \
 --o-visualization data/diversity/shannon-group-significance.qzv

## unzip alpha and beta files

unzip data/diversity/shannon-group-significance.qzv -d data/diversity/unzipped-alpha
unzip data/diversity/bray_curtis_emperor.qzv -d data/diversity/unzipped-beta

## open index.html files within unzipped-alpha and unzipped-beta with "live server" extension to visualize HTML
## select "treatment group" for alpha plot
## screenshot alpha and beta plots, and upload to plots/