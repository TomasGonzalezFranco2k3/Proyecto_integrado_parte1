#!/usr/bin/env bash
set -euo pipefail

IN="data/fastq"
OUT="qc/pre"
LOGD="logs"
mkdir -p "${OUT}" "${LOGD}"

# FastQC sobre todas las lecturas crudas
fastqc -t 4 -o "${OUT}" "${IN}"/*.fastq.gz 2> "${LOGD}/fastqc_pre.log"

# MultiQC consolidado
multiqc "${OUT}" -o "${OUT}" 2> "${LOGD}/multiqc_pre.log"

echo "[OK] QC pre-trimming en ${OUT}"

#Aqui tenemos el qc de los datos crudos, previos al trimming
