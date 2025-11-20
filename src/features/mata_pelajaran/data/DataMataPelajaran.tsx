import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { BookOpen, User, Award, Hash } from "lucide-react";

interface MataPelajaran {
    name: string;
    code: string;
    kelas: string;
    kkm: number;
    guru: string;
}

export const dataMataPelajaran: MataPelajaran[] = [
    {
        code: "MTK10",
        guru: "Tasya",
        kelas: "X MIA 1",
        kkm: 75,
        name: "Matematika Diskrit"
    },
    {
        code: "FIS10",
        guru: "Budi Santoso",
        kelas: "X MIA 1",
        kkm: 70,
        name: "Fisika"
    },
    {
        code: "KIM10",
        guru: "Siti Nurhaliza",
        kelas: "X MIA 2",
        kkm: 72,
        name: "Kimia"
    },
    {
        code: "BIO10",
        guru: "Ahmad Fauzi",
        kelas: "X MIA 1",
        kkm: 73,
        name: "Biologi"
    },
    {
        code: "ING10",
        guru: "Diana Putri",
        kelas: "X MIA 3",
        kkm: 75,
        name: "Bahasa Inggris"
    }
];
