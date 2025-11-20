-- CreateTable
CREATE TABLE "mata_pelajaran" (
    "id" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "deskripsi" TEXT,
    "kkm" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "kelasId" TEXT NOT NULL,
    "guruId" TEXT NOT NULL,

    CONSTRAINT "mata_pelajaran_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jadwal" (
    "id" TEXT NOT NULL,
    "hari" TEXT NOT NULL,
    "jamMulai" TEXT NOT NULL,
    "jamSelesai" TEXT NOT NULL,
    "ruangan" TEXT,
    "semester" INTEGER NOT NULL,
    "tahunAjar" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "kelasId" TEXT NOT NULL,
    "mataPelajaranId" TEXT NOT NULL,

    CONSTRAINT "jadwal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "nilai" (
    "id" TEXT NOT NULL,
    "jenisNilai" TEXT NOT NULL,
    "nilai" INTEGER NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "keterangan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "siswaId" TEXT NOT NULL,
    "mataPelajaranId" TEXT NOT NULL,

    CONSTRAINT "nilai_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "mata_pelajaran_kode_key" ON "mata_pelajaran"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "mata_pelajaran_kelasId_kode_key" ON "mata_pelajaran"("kelasId", "kode");

-- CreateIndex
CREATE UNIQUE INDEX "jadwal_kelasId_hari_jamMulai_semester_tahunAjar_key" ON "jadwal"("kelasId", "hari", "jamMulai", "semester", "tahunAjar");

-- AddForeignKey
ALTER TABLE "mata_pelajaran" ADD CONSTRAINT "mata_pelajaran_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES "kelas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mata_pelajaran" ADD CONSTRAINT "mata_pelajaran_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES "guru"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jadwal" ADD CONSTRAINT "jadwal_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES "kelas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jadwal" ADD CONSTRAINT "jadwal_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES "mata_pelajaran"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "nilai" ADD CONSTRAINT "nilai_siswaId_fkey" FOREIGN KEY ("siswaId") REFERENCES "siswa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "nilai" ADD CONSTRAINT "nilai_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES "mata_pelajaran"("id") ON DELETE CASCADE ON UPDATE CASCADE;
