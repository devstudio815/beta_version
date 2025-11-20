#!/bin/bash


# PostgreSQL 16 Backup Script
# Konfigurasi
DB_HOST="ep-frosty-truth-a1doyig5-pooler.ap-southeast-1.aws.neon.tech"
DB_PORT="5432"
DB_PASSWORD="npg_MEFai05TZYVG"
DB_USER="neondb_owner"
DB_NAME="report"
BACKUP_DIR="./postgres"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${DATE}.sql"
RETENTION_DAYS=7

# Warna untuk output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fungsi log
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Buat direktori backup jika belum ada
if [ ! -d "$BACKUP_DIR" ]; then
    log_info "Membuat direktori backup: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
fi

# Cek koneksi PostgreSQL
log_info "Mengecek koneksi ke PostgreSQL..."
log_info "Host: $DB_HOST"
log_info "User: $DB_USER"
log_info "Database: $DB_NAME"

# Test koneksi dengan SSL (required untuk Neon)
export PGSSLMODE=require
if ! PGPASSWORD="$DB_PASSWORD" psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c '\q' 2>&1; then
    log_error "Tidak dapat terhubung ke PostgreSQL"
    log_warning "Pastikan:"
    log_warning "1. PostgreSQL client terinstall (psql dan pg_dump)"
    log_warning "2. Koneksi internet stabil"
    log_warning "3. Credentials benar"
    exit 1
fi

log_info "Koneksi berhasil!"

log_info "Memulai backup database: $DB_NAME"
log_info "File backup: $BACKUP_FILE"

# Lakukan backup dengan pg_dump format SQL (dengan INSERT statements)
log_info "Memulai proses backup..."
export PGSSLMODE=require
if PGPASSWORD="$DB_PASSWORD" pg_dump -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" --column-inserts --data-only -f "$BACKUP_FILE"; then
    
    # Cek apakah backup benar-benar berhasil (file tidak kosong)
    if [ ! -s "$BACKUP_FILE" ]; then
        log_error "Backup gagal! File kosong."
        rm -f "$BACKUP_FILE"
        exit 1
    fi
    
    BACKUP_SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
    log_info "Backup berhasil! Ukuran: $BACKUP_SIZE"
    
    # Optional: Compress dengan gzip untuk menghemat space
    log_info "Mengkompress file..."
    gzip "$BACKUP_FILE"
    BACKUP_FILE="${BACKUP_FILE}.gz"
    COMPRESSED_SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
    log_info "File terkompress: $BACKUP_FILE (Ukuran: $COMPRESSED_SIZE)"
else
    log_error "Backup gagal!"
    rm -f "$BACKUP_FILE"
    exit 1
fi

# Hapus backup lama
log_info "Menghapus backup yang lebih lama dari $RETENTION_DAYS hari..."
find "$BACKUP_DIR" -name "${DB_NAME}_*.sql.gz" -mtime +$RETENTION_DAYS -type f -delete

# Tampilkan daftar backup
log_info "Daftar backup yang tersedia:"
ls -lh "$BACKUP_DIR"/${DB_NAME}_*.sql.gz 2>/dev/null | awk '{print $9, "-", $5}' || log_warning "Belum ada backup lain"

log_info "Proses backup selesai!"
log_info ""
log_info "Cara restore:"
log_info "gunzip -c $BACKUP_FILE | PGPASSWORD='your_password' psql -h HOST -p PORT -U USER -d DATABASE"