#!/usr/bin/env bash
set -euo pipefail

# Recursos (ajusta a tu pc porque puede explotar xd)
T=6   # hilos (Nucleos de tu pc)
M=9   # GB de RAM para SPAdes (No uses toda porque puedes crashear el pc deja un par de GB)

# Rutas
R1_RAW="data/fastq/anc_R1.fastq.gz"
R2_RAW="data/fastq/anc_R2.fastq.gz"
R1_TRM="data/trimmed/anc_R1.trim.fastq.gz"
R2_TRM="data/trimmed/anc_R2.trim.fastq.gz"
OUT_RAW="assembly/raw"
OUT_TRM="assembly/trimmed"
LOGD="logs"
mkdir -p "${OUT_RAW}" "${OUT_TRM}" "${LOGD}"

# Ensamblaje RAW
spades.py \
  -1 "${R1_RAW}" -2 "${R2_RAW}" \
  -o "${OUT_RAW}" -t "${T}" -m "${M}" \
  2> "${LOGD}/spades_raw.log"

# Ensamblaje TRIM
spades.py \
  -1 "${R1_TRM}" -2 "${R2_TRM}" \
  -o "${OUT_TRM}" -t "${T}" -m "${M}" \
  2> "${LOGD}/spades_trimmed.log"

echo "[OK] Ensamblajes listos: ${OUT_RAW} y ${OUT_TRM}"
