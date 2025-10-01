#!/usr/bin/env bash
set -euo pipefail

IN="maps"
for BAM in "${IN}"/evol*.sorted.bam; do
  sample=$(basename "${BAM}" .sorted.bam)
  depth=$(samtools depth -a "${BAM}" | awk '{s+=$3; n++} END{if(n>0) printf "%.2f", s/n; else print 0}')
  printf "%-12s mean_depth=%s×\n" "${sample}" "${depth}"
done
