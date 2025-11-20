// ===== DATA TYPES =====
interface DataJadwal {
    id: string;
    hari: string;
    jamMulai: string;
    jamSelesai: string;
    mataPelajaran: string;
    kodeMapel: string;
    kelas: string;
    guru: string;
    ruangan: string;
}

export const dataJadwal: DataJadwal[] = [
    {
        id: "JDW001",
        hari: "Senin",
        jamMulai: "07:00",
        jamSelesai: "08:30",
        mataPelajaran: "Matematika Diskrit",
        kodeMapel: "MTK10",
        kelas: "X MIA 1",
        guru: "Tasya",
        ruangan: "R.101"
    },
    {
        id: "JDW002",
        hari: "Senin",
        jamMulai: "08:30",
        jamSelesai: "10:00",
        mataPelajaran: "Fisika",
        kodeMapel: "FIS10",
        kelas: "X MIA 1",
        guru: "Budi Santoso",
        ruangan: "Lab Fisika"
    },
    {
        id: "JDW003",
        hari: "Senin",
        jamMulai: "10:15",
        jamSelesai: "11:45",
        mataPelajaran: "Bahasa Inggris",
        kodeMapel: "ING10",
        kelas: "X MIA 1",
        guru: "Diana Putri",
        ruangan: "R.103"
    },
    {
        id: "JDW004",
        hari: "Selasa",
        jamMulai: "07:00",
        jamSelesai: "08:30",
        mataPelajaran: "Kimia",
        kodeMapel: "KIM10",
        kelas: "X MIA 2",
        guru: "Siti Nurhaliza",
        ruangan: "Lab Kimia"
    },
    {
        id: "JDW005",
        hari: "Selasa",
        jamMulai: "08:30",
        jamSelesai: "10:00",
        mataPelajaran: "Biologi",
        kodeMapel: "BIO10",
        kelas: "X MIA 1",
        guru: "Ahmad Fauzi",
        ruangan: "Lab Biologi"
    },
    {
        id: "JDW006",
        hari: "Rabu",
        jamMulai: "07:00",
        jamSelesai: "08:30",
        mataPelajaran: "Matematika Diskrit",
        kodeMapel: "MTK10",
        kelas: "X MIA 2",
        guru: "Tasya",
        ruangan: "R.102"
    },
    {
        id: "JDW007",
        hari: "Rabu",
        jamMulai: "10:15",
        jamSelesai: "11:45",
        mataPelajaran: "Fisika",
        kodeMapel: "FIS10",
        kelas: "X MIA 2",
        guru: "Budi Santoso",
        ruangan: "Lab Fisika"
    },
    {
        id: "JDW008",
        hari: "Kamis",
        jamMulai: "07:00",
        jamSelesai: "08:30",
        mataPelajaran: "Bahasa Inggris",
        kodeMapel: "ING10",
        kelas: "X MIA 3",
        guru: "Diana Putri",
        ruangan: "R.104"
    },
    {
        id: "JDW009",
        hari: "Kamis",
        jamMulai: "13:00",
        jamSelesai: "14:30",
        mataPelajaran: "Kimia",
        kodeMapel: "KIM10",
        kelas: "X MIA 1",
        guru: "Siti Nurhaliza",
        ruangan: "Lab Kimia"
    },
    {
        id: "JDW010",
        hari: "Jumat",
        jamMulai: "07:00",
        jamSelesai: "08:30",
        mataPelajaran: "Biologi",
        kodeMapel: "BIO10",
        kelas: "X MIA 2",
        guru: "Ahmad Fauzi",
        ruangan: "R.105"
    },
    {
        id: "JDW011",
        hari: "Jumat",
        jamMulai: "08:30",
        jamSelesai: "10:00",
        mataPelajaran: "Matematika Diskrit",
        kodeMapel: "MTK10",
        kelas: "X MIA 3",
        guru: "Tasya",
        ruangan: "R.101"
    }
];