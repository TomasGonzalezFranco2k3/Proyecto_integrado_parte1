#!/usr/bin/env bash
set -euo pipefail

REF="assembly/raw/contigs.fasta"  # Toca definir cual se deja con el resultado del quast
TRIMD="data/trimmed"
OUTD="maps"
LOGD="logs"
mkdir -p "${OUTD}" "${LOGD}"

# Indexar referencia (si no existe)
bwa index "${REF}" 2> "${LOGD}/bwa_index.log" || true
samtools faidx "${REF}"

# EVOL1
bwa mem -t 4 "${REF}" \
  "${TRIMD}/evol1_R1.trim.fastq.gz" "${TRIMD}/evol1_R2.trim.fastq.gz" \
| samtools view -@ 4 -bS - \
| samtools sort -@ 4 -o "${OUTD}/evol1.sorted.bam"
samtools index "${OUTD}/evol1.sorted.bam"
samtools flagstat "${OUTD}/evol1.sorted.bam" > "${OUTD}/evol1.flagstat.txt"

# EVOL2
bwa mem -t 4 "${REF}" \
  "${TRIMD}/evol2_R1.trim.fastq.gz" "${TRIMD}/evol2_R2.trim.fastq.gz" \
| samtools view -@ 4 -bS - \
| samtools sort -@ 4 -o "${OUTD}/evol2.sorted.bam"
samtools index "${OUTD}/evol2.sorted.bam"
samtools flagstat "${OUTD}/evol2.sorted.bam" > "${OUTD}/evol2.flagstat.txt"

echo "[OK] Mapeos listos en ${OUTD}"
