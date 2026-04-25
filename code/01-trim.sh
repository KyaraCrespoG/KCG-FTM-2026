#!/bin/bash

## demux summarize to trim out bad reads

qiime demux summarize \
  --i-data data/demux/qza/fmt-tutorial-demux-1.qza \
  --o-visualization data/demux/summaries/demux-summary-1.qzv
qiime demux summarize \
  --i-data data/demux/qza/fmt-tutorial-demux-2.qza \
  --o-visualization data/demux/summaries/demux-summary-2.qzv

## proceed to 02-denoising.sh