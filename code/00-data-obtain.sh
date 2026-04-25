#!/bin/bash
conda activate qiime2-amplicon-2026.1

# cd ~/KCG-FMT-2026

# get metadata from fmt tutorial website
wget \
  -O "data/metadata/sample-metadata.tsv" \
  "https://data.qiime2.org/2024.10/tutorials/fmt/sample_metadata.tsv"

# get 10% subsample data
wget \
  -O "data/demux/qza/fmt-tutorial-demux-1.qza" \
  "https://data.qiime2.org/2024.10/tutorials/fmt/fmt-tutorial-demux-1-10p.qza"

wget \
  -O "data/demux/qza/fmt-tutorial-demux-2.qza" \
  "https://data.qiime2.org/2024.10/tutorials/fmt/fmt-tutorial-demux-2-10p.qza"

## download SILVA138.2_SSURef_NR99_uniform_classifier_V4V5-515f-926r.qza from https://www.arb-silva.de/current-release/QIIME2/2025.7/SSU/V4V5-515f-926r/uniform onto local computer, then drag and drop into data/taxonomy-classifier to upload

## if classifier is in cd ~/ then
mv SILVA138.2_SSURef_NR99_uniform_classifier_V4V5-515f-926r.qza data/taxonomy-classifier

## proceed to 01-trim.sh