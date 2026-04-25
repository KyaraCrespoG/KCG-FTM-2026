#!/bin/bash

## denoise data with DADA2 in qiime2

qiime dada2 denoise-single \
    --p-trim-left 13 \
    --p-trunc-len 150 \
    --i-demultiplexed-seqs data/demux/qza/fmt-tutorial-demux-1.qza \
    --o-representative-sequences data/dada2/dataset1/rep-seqs-1.qza \
    --o-table data/dada2/dataset1/table-1.qza \
    --o-denoising-stats data/dada2/dataset1/stats-1.qza \
    --o-base-transition-stats data/dada2/dataset1/bt-stats1.qza

qiime dada2 denoise-single \
    --p-trim-left 13 \
    --p-trunc-len 150 \
    --i-demultiplexed-seqs data/demux/qza/fmt-tutorial-demux-2.qza \
    --o-representative-sequences data/dada2/dataset2/rep-seqs-2.qza \
    --o-table data/dada2/dataset2/table-2.qza \
    --o-denoising-stats data/dada2/dataset2/stats-2.qza \
    --o-base-transition-stats data/dada2/dataset2/bt-stats2.qza

## merge both data sets tables and sequences

qiime feature-table merge \
    --i-tables data/dada2/dataset1/table-1.qza data/dada2/dataset2/table-2.qza \
    --o-merged-table data/dada2/combined-sets/table.qza

qiime feature-table merge-seqs \
    --i-data data/dada2/dataset1/rep-seqs-1.qza data/dada2/dataset2/rep-seqs-2.qza \
    --o-merged-data data/dada2/combined-sets/rep-seqs.qza

## visualize denoising stats to verify data merge went smoothly

qiime feature-table summarize \
    --i-table data/dada2/combined-sets/table.qza \
    --output-dir data/dada2/combined-sets/table-summary

unzip data/dada2/combined-sets/table-summary/summary.qzv -d data/dada2/combined-sets/table-summary/summary_view

## open data/dada2/combined-sets/table-summary/summary_view/058b5429-4efb-4155-bcb6-0dffcac1d9de/data/index.html with "live server" extension to visualize HTML
## ensure data makes sense: multiple samples have different frequencies and features, with some being more predominant. data properly reflects healthy microbiome dataset, with variability within a normal range

## proceed to 03-classify.sh