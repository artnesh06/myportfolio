#!/bin/bash
# Backup konten CMS portfolio ke lokal — jalanin kapan aja: ./backup-content.sh
cd "$(dirname "$0")"
TS=$(date +%Y%m%d_%H%M%S)
OUT="backups/content_$TS.json"
if curl -sf -m 30 https://api-portfolio.artnesh.cloud/content -o "$OUT" && [ -s "$OUT" ]; then
  echo "OK → $OUT ($(du -h "$OUT" | cut -f1))"
else
  rm -f "$OUT"; echo "GAGAL — cek koneksi/API"
fi
