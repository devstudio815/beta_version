"use client"
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Input } from "@/components/ui/input";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Calendar, Clock, BookOpen, User, MapPin, Search, Filter } from "lucide-react";
import { useState } from "react";
import { dataJadwal } from "../dataJadwal";

export default function TableJadwal() {
    const [searchTerm, setSearchTerm] = useState("");
    const [filterHari, setFilterHari] = useState("all");
    const [filterKelas, setFilterKelas] = useState("all");

    // Get unique values for filters
    const uniqueHari = ["all", ...Array.from(new Set(dataJadwal.map(item => item.hari)))];
    const uniqueKelas = ["all", ...Array.from(new Set(dataJadwal.map(item => item.kelas)))];

    // Filter logic
    const filteredData = dataJadwal.filter(item => {
        const matchSearch = 
            item.mataPelajaran.toLowerCase().includes(searchTerm.toLowerCase()) ||
            item.guru.toLowerCase().includes(searchTerm.toLowerCase()) ||
            item.kodeMapel.toLowerCase().includes(searchTerm.toLowerCase()) ||
            item.ruangan.toLowerCase().includes(searchTerm.toLowerCase());
        
        const matchHari = filterHari === "all" || item.hari === filterHari;
        const matchKelas = filterKelas === "all" || item.kelas === filterKelas;

        return matchSearch && matchHari && matchKelas;
    });

    // Sort by hari order
    const hariOrder = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];
    const sortedData = filteredData.sort((a, b) => {
        const hariCompare = hariOrder.indexOf(a.hari) - hariOrder.indexOf(b.hari);
        if (hariCompare !== 0) return hariCompare;
        return a.jamMulai.localeCompare(b.jamMulai);
    });

    const getHariColor = (hari: string) => {
        const colors: Record<string, string> = {
            "Senin": "bg-red-100 text-red-700",
            "Selasa": "bg-orange-100 text-orange-700",
            "Rabu": "bg-yellow-100 text-yellow-700",
            "Kamis": "bg-green-100 text-green-700",
            "Jumat": "bg-blue-100 text-blue-700",
            "Sabtu": "bg-purple-100 text-purple-700"
        };
        return colors[hari] || "bg-gray-100 text-gray-700";
    };

    return (
        <div className="w-full min-h-screen">
            <div className=" mx-auto">
              

                {/* Filter & Search Section */}
                <div className="rounded-2xl shadow-lg p-6 mb-6 border">
                    <div className="flex items-center gap-2 mb-4">
                        <Filter className="w-5 h-5 text-indigo-600" />
                        <h2 className="text-lg font-semibold text-gray-800">Filter & Pencarian</h2>
                    </div>
                    
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                        {/* Search */}
                        <div className="relative">
                            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-gray-400" />
                            <Input
                                placeholder="Cari mapel, guru, kode, ruangan..."
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                                className="pl-10 border-gray-300 focus:border-indigo-500"
                            />
                        </div>

                        {/* Filter Hari */}
                        <Select value={filterHari} onValueChange={setFilterHari}>
                            <SelectTrigger className="border-gray-300 focus:border-indigo-500">
                                <SelectValue placeholder="Filter Hari" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">Semua Hari</SelectItem>
                                {uniqueHari.slice(1).map(hari => (
                                    <SelectItem key={hari} value={hari}>{hari}</SelectItem>
                                ))}
                            </SelectContent>
                        </Select>

                        {/* Filter Kelas */}
                        <Select value={filterKelas} onValueChange={setFilterKelas}>
                            <SelectTrigger className="border-gray-300 focus:border-indigo-500">
                                <SelectValue placeholder="Filter Kelas" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">Semua Kelas</SelectItem>
                                {uniqueKelas.slice(1).map(kelas => (
                                    <SelectItem key={kelas} value={kelas}>{kelas}</SelectItem>
                                ))}
                            </SelectContent>
                        </Select>
                    </div>

                    {/* Result Count */}
                    <div className="mt-4 text-sm text-gray-600">
                        Menampilkan <span className="font-bold text-indigo-600">{sortedData.length}</span> dari {dataJadwal.length} jadwal
                    </div>
                </div>

                {/* Table */}
                <div className="bg-white rounded-2xl shadow-2xl overflow-hidden border border-gray-100">
                    <Table>
                        <TableHeader>
                            <TableRow className="bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-600 hover:to-purple-600">
                                <TableHead className="text-center text-white font-semibold border-r border-indigo-500">
                                    <div className="flex items-center justify-center gap-2">
                                        <Calendar className="w-4 h-4" />
                                        Hari
                                    </div>
                                </TableHead>
                                <TableHead className="text-center text-white font-semibold border-r border-indigo-500">
                                    <div className="flex items-center justify-center gap-2">
                                        <Clock className="w-4 h-4" />
                                        Waktu
                                    </div>
                                </TableHead>
                                <TableHead className="text-center text-white font-semibold border-r border-indigo-500">
                                    <div className="flex items-center justify-center gap-2">
                                        <BookOpen className="w-4 h-4" />
                                        Mata Pelajaran
                                    </div>
                                </TableHead>
                                <TableHead className="text-center text-white font-semibold border-r border-indigo-500">
                                    Kelas
                                </TableHead>
                                <TableHead className="text-left text-white font-semibold border-r border-indigo-500">
                                    <div className="flex items-center justify-center gap-2">
                                        <User className="w-4 h-4" />
                                        Guru
                                    </div>
                                </TableHead>
                                <TableHead className="text-center text-white font-semibold">
                                    <div className="flex items-center justify-center gap-2">
                                        <MapPin className="w-4 h-4" />
                                        Ruangan
                                    </div>
                                </TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {sortedData.length === 0 ? (
                                <TableRow>
                                    <TableCell colSpan={6} className="text-center py-12">
                                        <div className="flex flex-col items-center gap-3">
                                            <Search className="w-12 h-12 text-gray-300" />
                                            <p className="text-gray-500 font-medium">Tidak ada jadwal ditemukan</p>
                                            <p className="text-sm text-gray-400">Coba ubah filter atau kata kunci pencarian</p>
                                        </div>
                                    </TableCell>
                                </TableRow>
                            ) : (
                                sortedData.map((item) => (
                                    <TableRow 
                                        key={item.id}
                                        className="hover:bg-gradient-to-r hover:from-indigo-50 hover:to-purple-50 transition-all duration-300 border-b border-gray-100"
                                    >
                                        <TableCell className="border-r border-gray-100">
                                            <span className={`inline-block px-3 py-1.5 rounded-lg text-sm font-bold ${getHariColor(item.hari)}`}>
                                                {item.hari}
                                            </span>
                                        </TableCell>
                                        <TableCell className="text-center border-r border-gray-100">
                                            <div className="flex flex-row text-center justify-center items-center">
                                                <span className="font-semibold text-gray-800">{item.jamMulai}</span>
                                                <span className="font-semibold text-gray-800">- {item.jamSelesai}</span>
                                            </div>
                                        </TableCell>
                                        <TableCell className="border-r border-gray-100">
                                            <div>
                                                <p className="font-semibold text-gray-800">{item.mataPelajaran}</p>
                                                <p className="text-xs text-gray-500 font-mono">{item.kodeMapel}</p>
                                            </div>
                                        </TableCell>
                                        <TableCell className="text-center border-r border-gray-100">
                                            <span className="inline-block px-3 py-1.5 bg-gradient-to-r from-purple-500 to-pink-500 text-white rounded-full text-sm font-medium shadow-sm">
                                                {item.kelas}
                                            </span>
                                        </TableCell>
                                        <TableCell className="border-r border-gray-100">
                                            <div className="flex items-center gap-3">
                                                <div className="w-9 h-9 rounded-full bg-gradient-to-br from-indigo-400 to-purple-600 flex items-center justify-center text-white font-bold text-xs shadow-md">
                                                    {item.guru.charAt(0).toUpperCase()}
                                                </div>
                                                <span className="font-medium text-gray-700">{item.guru}</span>
                                            </div>
                                        </TableCell>
                                        <TableCell className="text-center">
                                            <span className="inline-block px-3 py-1.5 bg-indigo-50 text-indigo-700 rounded-lg text-sm font-medium border border-indigo-200">
                                                {item.ruangan}
                                            </span>
                                        </TableCell>
                                    </TableRow>
                                ))
                            )}
                        </TableBody>
                    </Table>
                </div>
            </div>
        </div>
    );
}