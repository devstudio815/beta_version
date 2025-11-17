export interface Kelas {
    siswa : {
         id: string;
        nama: string;
        createdAt: Date;
        updatedAt: Date;
        nis: string;
        nisn: string;
        jenisKelamin: string;
        tanggalLahir: Date;
        tempatLahir: string;
        alamat: string;
        email: string | null;
        telepon: string | null;
        kelasId: string | null
    }[]
    tingkat: number;
    id: string;
    nama: string;
    tahunAjar: string;
    createdAt: Date;
    updatedAt: Date;
    waliKelasId: string | null;
}


export interface ReportGenderOnClassByTingkat {
    tingkat : number
    jumlah_siswa : number
    laki_laki : number
    perempuan : number
}