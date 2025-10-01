#!/usr/bin/env bash
set -euo pipefail

IN="data/trimmed"
OUT="qc/post"
QCFP="qc/fastp"
LOGD="logs"
mkdir -p "${OUT}" "${LOGD}"

# FastQC sobre trimmed
fastqc -t 4 -o "${OUT}" "${IN}"/*.fastq.gz 2> "${LOGD}/fastqc_post.log"

# MultiQC: incluye FastQC post + reportes fastp
multiqc "${OUT}" "${QCFP}" -o "${OUT}" 2> "${LOGD}/multiqc_post.log"

echo "[OK] QC post-trimming en ${OUT}"
