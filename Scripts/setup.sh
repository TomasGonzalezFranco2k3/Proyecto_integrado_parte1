#!/usr/bin/env bash
set -euo pipefail

# carpeta del proyecto (. significa carpeta actual)
ROOT="."
# Carpetas
REF="${ROOT}/data/ref"
FASTQ="${ROOT}/data/fastq"
TRIM="${ROOT}/data/trimmed"
QC_PRE="${ROOT}/qc/pre"
QC_POST="${ROOT}/qc/post"
QC_FASTP="${ROOT}/qc/fastp"
ASM_RAW="${ROOT}/assembly/raw"
ASM_TRIM="${ROOT}/assembly/trimmed"
QUAST="${ROOT}/quast/combined"
MAPS="${ROOT}/maps"
LOGS="${ROOT}/logs"

mkdir -p "${REF}" "${FASTQ}" "${TRIM}" \
         "${QC_PRE}" "${QC_POST}" "${QC_FASTP}" \
         "${ASM_RAW}" "${ASM_TRIM}" \
         "${QUAST}" "${MAPS}" "${LOGS}"

echo "[OK] Estructura creada."
echo "Los FASTQ crudos van en: ${FASTQ}"


#Aqui lo que hacemos es crear la estrucutra de carpetas que vamos a necesitar
