"use client"
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { 
    User, 
    FileText,
    UserCheck,
    Trophy,
    AlertCircle,
    CheckCircle2,
    XCircle,
    TrendingUp,
    BarChart3,
    PieChart as PieChartIcon
} from "lucide-react";
import {
    BarChart,
    Bar,
    LineChart,
    Line,
    PieChart,
    Pie,
    Cell,
    RadarChart,
    Radar,
    PolarGrid,
    PolarAngleAxis,
    PolarRadiusAxis,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    Legend,
    ResponsiveContainer
} from 'recharts';

// Import data (sesuaikan dengan path Anda)
import { dataLaporanAkademik } from "../data/NilaiMataPelajaran";

export default function LaporanAkademik() {
    const laporan = dataLaporanAkademik;
    
    // Prepare data for charts
    const chartDataNilai = laporan.daftarNilai.map(nilai => ({
        name: nilai.namaMapel.length > 15 ? nilai.kodeMapel : nilai.namaMapel,
        'Nilai Akhir': nilai.nilaiAkhir,
        'KKM': nilai.kkm,
        'Tugas': nilai.nilaiTugas,
        'UTS': nilai.nilaiUTS,
        'UAS': nilai.nilaiUAS
    }));

    const radarData = laporan.daftarNilai.map(nilai => ({
        subject: nilai.kodeMapel,
        nilai: nilai.nilaiAkhir,
        fullMark: 100
    }));

    const kehadiranData = [
        { name: 'Hadir', value: laporan.kehadiran.totalHari - laporan.kehadiran.sakit - laporan.kehadiran.izin - laporan.kehadiran.alpha, color: '#10b981' },
        { name: 'Sakit', value: laporan.kehadiran.sakit, color: '#3b82f6' },
        { name: 'Izin', value: laporan.kehadiran.izin, color: '#eab308' },
        { name: 'Alpha', value: laporan.kehadiran.alpha, color: '#ef4444' }
    ];

    const predikatData = laporan.daftarNilai.reduce((acc, nilai) => {
        const existing = acc.find(item => item.name === nilai.predikat);
        if (existing) {
            existing.value += 1;
        } else {
            acc.push({ name: nilai.predikat, value: 1 });
        }
        return acc;
    }, [] as Array<{name: string, value: number}>);

    const PREDIKAT_COLORS: Record<string, string> = {
        'A': '#10b981',
        'B': '#3b82f6',
        'C': '#eab308',
        'D': '#f97316',
        'E': '#ef4444'
    };

    const getNilaiColor = (nilai: number, kkm: number) => {
        if (nilai >= 90) return "text-green-600 font-bold";
        if (nilai >= 80) return "text-blue-600 font-semibold";
        if (nilai >= kkm) return "text-yellow-600 font-medium";
        return "text-red-600 font-bold";
    };

    const getPredikatColor = (predikat: string) => {
        const colors: Record<string, string> = {
            "A": "bg-green-100 text-green-700 border-green-300",
            "B": "bg-blue-100 text-blue-700 border-blue-300",
            "C": "bg-yellow-100 text-yellow-700 border-yellow-300",
            "D": "bg-orange-100 text-orange-700 border-orange-300",
            "E": "bg-red-100 text-red-700 border-red-300"
        };
        return colors[predikat] || "bg-gray-100 text-gray-700 border-gray-300";
    };

    const kehadiranPersentase = ((laporan.kehadiran.totalHari - laporan.kehadiran.sakit - laporan.kehadiran.izin - laporan.kehadiran.alpha) / laporan.kehadiran.totalHari * 100).toFixed(1);

    return (
        <div className="w-full min-h-screen">
            <div className="mx-auto">
                {/* Header */}
                <div className="mb-8">
                    <h1 className="text-4xl font-bold text-gray-800 mb-2">Laporan Akademik Siswa</h1>
                    <p className="text-gray-600 text-lg">Tahun Ajaran {laporan.siswa.tahunAjaran} - Semester {laporan.siswa.semester}</p>
                </div>

                {/* Info Siswa & Summary Cards */}
                <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
                    {/* Info Siswa */}
                    <Card className="lg:col-span-2 border-2 border-blue-100">
                        <CardHeader className="bg-gradient-to-r from-blue-600 to-indigo-600 text-white rounded-t-lg">
                            <CardTitle className="flex items-center gap-2">
                                <User className="w-5 h-5" />
                                Informasi Siswa
                            </CardTitle>
                        </CardHeader>
                        <CardContent className="pt-6">
                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <p className="text-sm text-gray-500">NIS</p>
                                    <p className="font-semibold text-gray-800">{laporan.siswa.nis}</p>
                                </div>
                                <div>
                                    <p className="text-sm text-gray-500">Nama Lengkap</p>
                                    <p className="font-semibold text-gray-800">{laporan.siswa.nama}</p>
                                </div>
                                <div>
                                    <p className="text-sm text-gray-500">Kelas</p>
                                    <p className="font-semibold text-gray-800">{laporan.siswa.kelas}</p>
                                </div>
                                <div>
                                    <p className="text-sm text-gray-500">Jurusan</p>
                                    <p className="font-semibold text-gray-800">{laporan.siswa.jurusan}</p>
                                </div>
                                <div>
                                    <p className="text-sm text-gray-500">Wali Kelas</p>
                                    <p className="font-semibold text-gray-800">{laporan.waliKelas}</p>
                                </div>
                            </div>
                        </CardContent>
                    </Card>

                    {/* Summary Cards */}
                    <div className="space-y-4">
                        <Card className="border-2 border-green-100">
                            <CardContent className="pt-6">
                                <div className="flex items-center justify-between">
                                    <div>
                                        <p className="text-sm text-gray-500 mb-1">Rata-rata Nilai</p>
                                        <p className="text-3xl font-bold text-green-600">{laporan.rataRata}</p>
                                    </div>
                                    <div className="w-14 h-14 rounded-full bg-green-100 flex items-center justify-center">
                                        <TrendingUp className="w-7 h-7 text-green-600" />
                                    </div>
                                </div>
                            </CardContent>
                        </Card>

                        <Card className="border-2 border-purple-100">
                            <CardContent className="pt-6">
                                <div className="flex items-center justify-between">
                                    <div>
                                        <p className="text-sm text-gray-500 mb-1">Peringkat Kelas</p>
                                        <p className="text-3xl font-bold text-purple-600">{laporan.peringkat} / {laporan.totalSiswa}</p>
                                    </div>
                                    <div className="w-14 h-14 rounded-full bg-purple-100 flex items-center justify-center">
                                        <Trophy className="w-7 h-7 text-purple-600" />
                                    </div>
                                </div>
                            </CardContent>
                        </Card>
                    </div>
                </div>

                {/* Charts Section */}
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
                    {/* Bar Chart - Perbandingan Nilai */}
                    <Card className="border-2 border-indigo-100">
                        <CardHeader className="bg-gradient-to-r from-indigo-600 to-blue-600 text-white">
                            <CardTitle className="flex items-center gap-2">
                                <BarChart3 className="w-5 h-5" />
                                Perbandingan Nilai per Mata Pelajaran
                            </CardTitle>
                            <CardDescription className="text-indigo-100">
                                Nilai Akhir vs KKM
                            </CardDescription>
                        </CardHeader>
                        <CardContent className="pt-6">
                            <ResponsiveContainer width="100%" height={300}>
                                <BarChart data={chartDataNilai}>
                                    <CartesianGrid strokeDasharray="3 3" />
                                    <XAxis dataKey="name" angle={-45} textAnchor="end" height={100} style={{ fontSize: '12px' }} />
                                    <YAxis domain={[0, 100]} />
                                    <Tooltip />
                                    <Legend />
                                    <Bar dataKey="Nilai Akhir" fill="#3b82f6" />
                                    <Bar dataKey="KKM" fill="#ef4444" />
                                </BarChart>
                            </ResponsiveContainer>
                        </CardContent>
                    </Card>

                    {/* Radar Chart - Profil Nilai */}
                    <Card className="border-2 border-purple-100">
                        <CardHeader className="bg-gradient-to-r from-purple-600 to-pink-600 text-white">
                            <CardTitle className="flex items-center gap-2">
                                <PieChartIcon className="w-5 h-5" />
                                Profil Nilai Akademik
                            </CardTitle>
                            <CardDescription className="text-purple-100">
                                Radar Chart Nilai
                            </CardDescription>
                        </CardHeader>
                        <CardContent className="pt-6">
                            <ResponsiveContainer width="100%" height={300}>
                                <RadarChart data={radarData}>
                                    <PolarGrid />
                                    <PolarAngleAxis dataKey="subject" />
                                    <PolarRadiusAxis angle={90} domain={[0, 100]} />
                                    <Radar name="Nilai" dataKey="nilai" stroke="#8b5cf6" fill="#8b5cf6" fillOpacity={0.6} />
                                    <Tooltip />
                                </RadarChart>
                            </ResponsiveContainer>
                        </CardContent>
                    </Card>

                    {/* Line Chart - Tren Nilai */}
                    <Card className="border-2 border-green-100">
                        <CardHeader className="bg-gradient-to-r from-green-600 to-emerald-600 text-white">
                            <CardTitle className="flex items-center gap-2">
                                <TrendingUp className="w-5 h-5" />
                                Tren Nilai (Tugas → UTS → UAS)
                            </CardTitle>
                            <CardDescription className="text-green-100">
                                Perkembangan nilai sepanjang semester
                            </CardDescription>
                        </CardHeader>
                        <CardContent className="pt-6">
                            <ResponsiveContainer width="100%" height={300}>
                                <LineChart data={chartDataNilai}>
                                    <CartesianGrid strokeDasharray="3 3" />
                                    <XAxis dataKey="name" angle={-45} textAnchor="end" height={100} style={{ fontSize: '12px' }} />
                                    <YAxis domain={[0, 100]} />
                                    <Tooltip />
                                    <Legend />
                                    <Line type="monotone" dataKey="Tugas" stroke="#f59e0b" strokeWidth={2} />
                                    <Line type="monotone" dataKey="UTS" stroke="#3b82f6" strokeWidth={2} />
                                    <Line type="monotone" dataKey="UAS" stroke="#10b981" strokeWidth={2} />
                                </LineChart>
                            </ResponsiveContainer>
                        </CardContent>
                    </Card>

                    {/* Pie Charts */}
                    <div className="space-y-6">
                        {/* Pie Chart - Distribusi Predikat */}
                        <Card className="border-2 border-orange-100">
                            <CardHeader className="bg-gradient-to-r from-orange-600 to-red-600 text-white">
                                <CardTitle className="flex items-center gap-2">
                                    <PieChartIcon className="w-5 h-5" />
                                    Distribusi Predikat
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="pt-6">
                                <ResponsiveContainer width="100%" height={180}>
                                    <PieChart>
                                        <Pie
                                            data={predikatData}
                                            cx="50%"
                                            cy="50%"
                                            labelLine={false}
                                            label={({ name, percent }) => `${name}: ${(percent as number * 100).toFixed(0)}%`}
                                            outerRadius={60}
                                            fill="#8884d8"
                                            dataKey="value"
                                        >
                                            {predikatData.map((entry, index) => (
                                                <Cell key={`cell-${index}`} fill={PREDIKAT_COLORS[entry.name]} />
                                            ))}
                                        </Pie>
                                        <Tooltip />
                                    </PieChart>
                                </ResponsiveContainer>
                            </CardContent>
                        </Card>

                        {/* Pie Chart - Kehadiran */}
                        <Card className="border-2 border-blue-100">
                            <CardHeader className="bg-gradient-to-r from-blue-600 to-cyan-600 text-white">
                                <CardTitle className="flex items-center gap-2">
                                    <UserCheck className="w-5 h-5" />
                                    Kehadiran ({kehadiranPersentase}%)
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="pt-6">
                                <ResponsiveContainer width="100%" height={180}>
                                    <PieChart>
                                        <Pie
                                            data={kehadiranData}
                                            cx="50%"
                                            cy="50%"
                                            labelLine={false}
                                            label={({ name, percent }) => `${name}: ${(percent as number * 100).toFixed(0)}%`}
                                            outerRadius={60}
                                            fill="#8884d8"
                                            dataKey="value"
                                        >
                                            {kehadiranData.map((entry, index) => (
                                                <Cell key={`cell-${index}`} fill={entry.color} />
                                            ))}
                                        </Pie>
                                        <Tooltip />
                                    </PieChart>
                                </ResponsiveContainer>
                            </CardContent>
                        </Card>
                    </div>
                </div>

                {/* Tabel Nilai */}
                <Card className="mb-6 border-2 border-gray-100">
                    <CardHeader className="bg-gradient-to-r from-indigo-600 to-purple-600 text-white">
                        <CardTitle className="flex items-center gap-2">
                            <FileText className="w-5 h-5" />
                            Daftar Nilai Mata Pelajaran
                        </CardTitle>
                        <CardDescription className="text-indigo-100">
                            Detail nilai per mata pelajaran semester ini
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="pt-6">
                        <div className="overflow-x-auto">
                            <Table>
                                <TableHeader>
                                    <TableRow className="bg-gray-50">
                                        <TableHead className="text-center font-semibold border-r">No</TableHead>
                                        <TableHead className="font-semibold border-r">Mata Pelajaran</TableHead>
                                        <TableHead className="text-center font-semibold border-r">KKM</TableHead>
                                        <TableHead className="text-center font-semibold border-r">Tugas</TableHead>
                                        <TableHead className="text-center font-semibold border-r">UTS</TableHead>
                                        <TableHead className="text-center font-semibold border-r">UAS</TableHead>
                                        <TableHead className="text-center font-semibold border-r">Nilai Akhir</TableHead>
                                        <TableHead className="text-center font-semibold border-r">Predikat</TableHead>
                                        <TableHead className="text-center font-semibold">Keterangan</TableHead>
                                    </TableRow>
                                </TableHeader>
                                <TableBody>
                                    {laporan.daftarNilai.map((nilai, index) => (
                                        <TableRow key={nilai.kodeMapel} className="hover:bg-blue-50 transition-colors">
                                            <TableCell className="text-center border-r font-medium">{index + 1}</TableCell>
                                            <TableCell className="border-r">
                                                <div>
                                                    <p className="font-semibold text-gray-800">{nilai.namaMapel}</p>
                                                    <p className="text-xs text-gray-500 font-mono">{nilai.kodeMapel}</p>
                                                </div>
                                            </TableCell>
                                            <TableCell className="text-center border-r font-semibold">{nilai.kkm}</TableCell>
                                            <TableCell className={`text-center border-r ${getNilaiColor(nilai.nilaiTugas, nilai.kkm)}`}>
                                                {nilai.nilaiTugas}
                                            </TableCell>
                                            <TableCell className={`text-center border-r ${getNilaiColor(nilai.nilaiUTS, nilai.kkm)}`}>
                                                {nilai.nilaiUTS}
                                            </TableCell>
                                            <TableCell className={`text-center border-r ${getNilaiColor(nilai.nilaiUAS, nilai.kkm)}`}>
                                                {nilai.nilaiUAS}
                                            </TableCell>
                                            <TableCell className={`text-center border-r ${getNilaiColor(nilai.nilaiAkhir, nilai.kkm)}`}>
                                                <span className="font-bold text-lg">{nilai.nilaiAkhir}</span>
                                            </TableCell>
                                            <TableCell className="text-center border-r">
                                                <span className={`inline-block px-3 py-1 rounded-full text-sm font-bold border-2 ${getPredikatColor(nilai.predikat)}`}>
                                                    {nilai.predikat}
                                                </span>
                                            </TableCell>
                                            <TableCell className="text-center">
                                                {nilai.keterangan === "TUNTAS" ? (
                                                    <div className="flex items-center justify-center gap-1 text-green-600">
                                                        <CheckCircle2 className="w-4 h-4" />
                                                        <span className="text-xs font-semibold">TUNTAS</span>
                                                    </div>
                                                ) : (
                                                    <div className="flex items-center justify-center gap-1 text-red-600">
                                                        <XCircle className="w-4 h-4" />
                                                        <span className="text-xs font-semibold">BELUM TUNTAS</span>
                                                    </div>
                                                )}
                                            </TableCell>
                                        </TableRow>
                                    ))}
                                </TableBody>
                            </Table>
                        </div>
                    </CardContent>
                </Card>

                {/* Catatan Wali Kelas */}
                <Card className="border-2 border-purple-100">
                    <CardHeader className="bg-gradient-to-r from-purple-600 to-pink-600 text-white">
                        <CardTitle className="flex items-center gap-2">
                            <AlertCircle className="w-5 h-5" />
                            Catatan Wali Kelas
                        </CardTitle>
                    </CardHeader>
                    <CardContent className="pt-6">
                        <div className="space-y-4">
                            <div>
                                <h4 className="font-semibold text-green-600 mb-2 flex items-center gap-2">
                                    <CheckCircle2 className="w-4 h-4" />
                                    Kelebihan:
                                </h4>
                                <ul className="list-disc list-inside space-y-1 text-sm text-gray-700">
                                    {laporan.catatan.kelebihan.map((item, idx) => (
                                        <li key={idx}>{item}</li>
                                    ))}
                                </ul>
                            </div>
                            <div>
                                <h4 className="font-semibold text-orange-600 mb-2 flex items-center gap-2">
                                    <AlertCircle className="w-4 h-4" />
                                    Perlu Ditingkatkan:
                                </h4>
                                <ul className="list-disc list-inside space-y-1 text-sm text-gray-700">
                                    {laporan.catatan.kekurangan.map((item, idx) => (
                                        <li key={idx}>{item}</li>
                                    ))}
                                </ul>
                            </div>
                            <div className="bg-blue-50 p-4 rounded-lg border border-blue-200">
                                <h4 className="font-semibold text-blue-600 mb-2">Saran:</h4>
                                <p className="text-sm text-gray-700 italic">{laporan.catatan.saran}</p>
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}