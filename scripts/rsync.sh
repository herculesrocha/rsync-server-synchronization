#!/bin/sh
#
# ==========================================================
# Script: rsync.sh
# Descrição:
#   Sincroniza o conteúdo do módulo remoto via rsync,
#   mantém backups de arquivos deletados, compacta esses
#   backups e realiza limpeza automática.
# Data: 21/01/2026
# Autor: Hercules Rocha
# ==========================================================

# Data/hora no formato seguro para nomes de arquivos
DATA=$(/bin/date +%Y%m%d-%H%M)

# Host remoto configurado no rsyncd
HOST="IPDOHOST"

# Nome do módulo rsync remoto
MODULO="www"

# Arquivo com exclusões do rsync
EXCLUDEFILE="/usr/local/exclude.txt"

# Diretório base do projeto
BASE="/usr/local/www/intranet.dominio.com.br"

DIRWWW="$BASE/www"      # Destino da sincronização
DIRDEL="$BASE/delete"   # Backups de arquivos deletados
DIRZIP="$BASE/zip"      # Arquivos compactados
DIRLOG="$BASE/logs"     # Logs do processo

# Cria os diretórios caso não existam
mkdir -p "$DIRWWW" "$DIRDEL" "$DIRZIP" "$DIRLOG"

# --------------------------
# SINCRONIZAÇÃO RSYNC
# --------------------------

/usr/local/bin/rsync -avz \
  --exclude-from="$EXCLUDEFILE" \
  --stats \
  --delete-during \
  --backup \
  --backup-dir="$DIRDEL" \
  "$HOST::$MODULO" \
  "$DIRWWW/" \
  > "$DIRLOG/$DATA-sync.log" 2>&1

# --------------------------
# BACKUP E LIMPEZA
# --------------------------

# Compacta os arquivos deletados pelo rsync
tar -jcf "$DIRZIP/del-$MODULO-$DATA.tar.bz2" "$DIRDEL"

# Remove arquivos compactados com mais de 7 dias
find "$DIRZIP" -type f -name "del-$MODULO-*" -mtime +7 -exec rm -f {} \;

# Remove arquivos do diretório delete com mais de 1 dia
find "$DIRDEL" -type f -mtime +0 -exec rm -f {} \;

# Remove logs antigos (mais de 7 dias)
find "$DIRLOG" -type f -name "*-sync.log" -mtime +7 -exec rm -f {} \;

# --------------------------
# FIM DO SCRIPT
# --------------------------
