#!/usr/bin/env bash
set -euo pipefail

RAW="assembly/raw/scaffolds.fasta"
TRM="assembly/trimmed/scaffolds.fasta"
OUT="quast/combined"
LOGD="logs"
mkdir -p "${OUT}" "${LOGD}"

quast -o "${OUT}" -t 4 -l RAW,TRIM "${RAW}" "${TRM}" 2> "${LOGD}/quast.log"

# Vista en terminal (esto es por si ya existe un report.tsv)
if [ -f "${OUT}/report.tsv" ]; then
  echo "=== Resumen QUAST (primeras 40 líneas) ==="
  column -t "${OUT}/report.tsv" | sed -n '1,40p' || true
fi

echo "[OK] QUAST generado en ${OUT}"
