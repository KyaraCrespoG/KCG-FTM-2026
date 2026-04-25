#!/bin/bash

## classify organisms within data set using taxonomy classifier SILVA V4V5 515f 16S

qiime feature-classifier classify-sklearn \
    --i-classifier data/taxonomy-classifier/SILVA138.2_SSURef_NR99_uniform_classifier_V4V5-515f-926r.qza \
    --i-reads data/dada2/combined-sets/rep-seqs.qza \
    --o-classification data/classify-results/taxonomy.qza

## visualize data for easier interpretation

qiime taxa barplot \
    --i-table data/dada2/combined-sets/table.qza \
    --i-taxonomy data/classify-results/taxonomy.qza \
    --m-metadata-file data/metadata/sample-metadata.tsv \
    --o-visualization data/classify-results/taxa-barplot.qzv

unzip data/classify-results/taxa-barplot.qzv -d data/classify-results/barplot_view

## open data/classify-results/barplot_view/db956e99-7971-4b64-a780-5b42e5fdbe6a/data/index.html with "live server" extension to visualize HTML
## select taxonomic level 2
