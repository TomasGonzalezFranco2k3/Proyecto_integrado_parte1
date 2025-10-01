#!/usr/bin/env bash
set -euo pipefail

IN="data/fastq"         # FASTQ crudos
OUTD="data/trimmed"     # FASTQ recortados
QCD="qc/fastp"          # informes HTML/JSON
LOGD="logs"             # logs de consola
mkdir -p "${OUTD}" "${QCD}" "${LOGD}"

# ===== ANC =====
fastp \
  -i "${IN}/anc_R1.fastq.gz" \
  -I "${IN}/anc_R2.fastq.gz" \
  -o "${OUTD}/anc_R1.trim.fastq.gz" \
  -O "${OUTD}/anc_R2.trim.fastq.gz" \
  --detect_adapter_for_pe \
  --qualified_quality_phred 25 \
  --length_required 50 \
  --cut_tail --cut_mean_quality 25 \
  --correction \
  -w 4 \
  --html "${QCD}/anc_fastp.html" \
  --json "${QCD}/anc_fastp.json" \
  2> "${LOGD}/anc_fastp.log"

# ===== EVOL1 =====
fastp \
  -i "${IN}/evol1_R1.fastq.gz" \
  -I "${IN}/evol1_R2.fastq.gz" \
  -o "${OUTD}/evol1_R1.trim.fastq.gz" \
  -O "${OUTD}/evol1_R2.trim.fastq.gz" \
  --detect_adapter_for_pe \
  --qualified_quality_phred 25 \
  --length_required 50 \
  --cut_tail --cut_mean_quality 25 \
  --correction \
  -w 4 \
  --html "${QCD}/evol1_fastp.html" \
  --json "${QCD}/evol1_fastp.json" \
  2> "${LOGD}/evol1_fastp.log"

# ===== EVOL2 =====
fastp \
  -i "${IN}/evol2_R1.fastq.gz" \
  -I "${IN}/evol2_R2.fastq.gz" \
  -o "${OUTD}/evol2_R1.trim.fastq.gz" \
  -O "${OUTD}/evol2_R2.trim.fastq.gz" \
  --detect_adapter_for_pe \
  --qualified_quality_phred 25 \
  --length_required 50 \
  --cut_tail --cut_mean_quality 25 \
  --correction \
  -w 4 \
  --html "${QCD}/evol2_fastp.html" \
  --json "${QCD}/evol2_fastp.json" \
  2> "${LOGD}/evol2_fastp.log"

