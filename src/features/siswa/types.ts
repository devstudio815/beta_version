export interface Siswa {
    id: string
    nis: string
    nisn: string
    nama: string
    jenisKelamin: string
    tanggalLahir: string | Date
    tempatLahir: string
    alamat: string
    email: string | null
    telepon: string | null
    createdAt: string | Date
    updatedAt: string | Date
    kelasId: string | null
    kelas: {
         id: string; createdAt: Date; nama: string; updatedAt: Date; tingkat: number; tahunAjar: string; waliKelasId: string | null;
    } | null
    siswaWali: { id: string; createdAt: Date; siswaId: string; waliSiswaId: string; isPrimary: boolean; }[]; 
}