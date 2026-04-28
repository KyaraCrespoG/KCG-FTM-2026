#!/bin/bash

## classify organisms within data set using taxonomy classifier SILVA V4V5 515f 16S

qiime feature-classifier classify-sklearn \
    --i-classifier data/taxonomy-classifier/SILVA138.2_SSURef_NR99_uniform_classifier_V4V5-515f-926r.qza \
    --i-reads data/dada2/combined-sets/rep-seqs.qza \
    --o-classification data/classify-results/taxonomy.qza


