// ===== DATA TYPES =====
export interface NilaiMataPelajaran {
    kodeMapel: string;
    namaMapel: string;
    kkm: number;
    nilaiTugas: number;
    nilaiUTS: number;
    nilaiUAS: number;
    nilaiAkhir: number;
    predikat: string;
    keterangan: string;
}

export interface LaporanAkademik {
    idLaporan: string;
    siswa: {
        nis: string;
        nama: string;
        kelas: string;
        jurusan: string;
        tahunAjaran: string;
        semester: string;
    };
    waliKelas: string;
    daftarNilai: NilaiMataPelajaran[];
    kehadiran: {
        sakit: number;
        izin: number;
        alpha: number;
        totalHari: number;
    };
    catatan: {
        kelebihan: string[];
        kekurangan: string[];
        saran: string;
    };
    rataRata: number;
    peringkat: number;
    totalSiswa: number;
}

// Function to calculate predikat
export function getPredikat(nilai: number, kkm: number): string {
    if (nilai >= 90) return "A";
    if (nilai >= 80) return "B";
    if (nilai >= kkm) return "C";
    if (nilai >= 60) return "D";
    return "E";
}

export function getKeterangan(nilai: number, kkm: number): string {
    return nilai >= kkm ? "TUNTAS" : "BELUM TUNTAS";
}

// Sample data
export const dataLaporanAkademik: LaporanAkademik = {
    idLaporan: "LAP001",
    siswa: {
        nis: "2024001",
        nama: "Ahmad Rizky Pratama",
        kelas: "X MIA 1",
        jurusan: "Matematika dan Ilmu Alam",
        tahunAjaran: "2024/2025",
        semester: "Ganjil"
    },
    waliKelas: "Tasya",
    daftarNilai: [
        {
            kodeMapel: "MTK10",
            namaMapel: "Matematika Diskrit",
            kkm: 75,
            nilaiTugas: 85,
            nilaiUTS: 82,
            nilaiUAS: 88,
            nilaiAkhir: 85,
            predikat: "B",
            keterangan: "TUNTAS"
        },
        {
            kodeMapel: "FIS10",
            namaMapel: "Fisika",
            kkm: 70,
            nilaiTugas: 78,
            nilaiUTS: 75,
            nilaiUAS: 80,
            nilaiAkhir: 78,
            predikat: "B",
            keterangan: "TUNTAS"
        },
        {
            kodeMapel: "KIM10",
            namaMapel: "Kimia",
            kkm: 72,
            nilaiTugas: 88,
            nilaiUTS: 90,
            nilaiUAS: 92,
            nilaiAkhir: 90,
            predikat: "A",
            keterangan: "TUNTAS"
        },
        {
            kodeMapel: "BIO10",
            namaMapel: "Biologi",
            kkm: 73,
            nilaiTugas: 80,
            nilaiUTS: 78,
            nilaiUAS: 82,
            nilaiAkhir: 80,
            predikat: "B",
            keterangan: "TUNTAS"
        },
        {
            kodeMapel: "ING10",
            namaMapel: "Bahasa Inggris",
            kkm: 75,
            nilaiTugas: 92,
            nilaiUTS: 88,
            nilaiUAS: 90,
            nilaiAkhir: 90,
            predikat: "A",
            keterangan: "TUNTAS"
        },
        {
            kodeMapel: "IND10",
            namaMapel: "Bahasa Indonesia",
            kkm: 75,
            nilaiTugas: 85,
            nilaiUTS: 80,
            nilaiUAS: 83,
            nilaiAkhir: 83,
            predikat: "B",
            keterangan: "TUNTAS"
        }
    ],
    kehadiran: {
        sakit: 2,
        izin: 1,
        alpha: 0,
        totalHari: 120
    },
    catatan: {
        kelebihan: [
            "Aktif dalam diskusi kelas",
            "Konsisten mengumpulkan tugas tepat waktu",
            "Menunjukkan kemampuan leadership yang baik"
        ],
        kekurangan: [
            "Perlu meningkatkan konsentrasi saat pelajaran matematika",
            "Terkadang terlambat masuk kelas"
        ],
        saran: "Ahmad menunjukkan potensi akademik yang sangat baik. Diharapkan dapat lebih konsisten dalam kehadiran dan meningkatkan fokus pada mata pelajaran yang masih perlu ditingkatkan."
    },
    rataRata: 84.3,
    peringkat: 5,
    totalSiswa: 32
};
