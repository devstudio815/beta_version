import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { dataMataPelajaran } from "../data/DataMataPelajaran";
import { Award, BookOpen, Hash, User } from "lucide-react";

export default function TableMataPelajaran() {
    const getKkmColor = (kkm: number) => {
        if (kkm >= 75) return "text-green-700 bg-green-50 border-green-200";
        if (kkm >= 70) return "text-blue-700 bg-blue-50 border-blue-200";
        return "text-orange-700 bg-orange-50 border-orange-200";
    };

    return (
        <div className="w-full min-h-screen">
            <div className=" mx-auto">
                {/* Table Container */}
                <div className=" rounded-2xl shadow-2xl overflow-hidden ">
                    <Table>
                        <TableHeader>
                            <TableRow className="bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-600 hover:to-purple-600">
                                <TableHead className="text-center text-white font-semibold border-r border-blue-500">
                                    <div className="flex items-center justify-center gap-2">
                                        <Hash className="w-4 h-4" />
                                        Code
                                    </div>
                                </TableHead>
                                <TableHead className="text-center text-white font-semibold border-r border-blue-500">
                                    <div className="flex items-center justify-center gap-2">
                                        <BookOpen className="w-4 h-4" />
                                        Nama Mata Pelajaran
                                    </div>
                                </TableHead>
                                <TableHead className="text-center text-white font-semibold border-r border-blue-500">
                                    Kelas
                                </TableHead>
                                <TableHead className="text-center text-white font-semibold border-r border-blue-500">
                                    <div className="flex items-center justify-center gap-2">
                                        <Award className="w-4 h-4" />
                                        KKM
                                    </div>
                                </TableHead>
                                <TableHead className="text-center text-white font-semibold">
                                    <div className="flex items-center justify-center gap-2">
                                        <User className="w-4 h-4" />
                                        Guru Pengajar
                                    </div>
                                </TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {dataMataPelajaran.map((item) => (
                                <TableRow 
                                    key={item.code}
                                    className="hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 transition-all duration-300 border-b border-gray-100"
                                >
                                    <TableCell className="text-center font-mono font-bold text-blue-600 border-r border-gray-100">
                                        {item.code}
                                    </TableCell>
                                    <TableCell className="font-semibold text-gray-800 border-r border-gray-100">
                                        {item.name}
                                    </TableCell>
                                    <TableCell className="text-center border-r border-gray-100">
                                        <span className="inline-block px-4 py-1.5 bg-gradient-to-r from-purple-500 to-pink-500 text-white rounded-full text-sm font-medium shadow-sm">
                                            {item.kelas}
                                        </span>
                                    </TableCell>
                                    <TableCell className="text-center border-r border-gray-100">
                                        <span className={`inline-block px-4 py-1.5 rounded-full text-sm font-bold border-2 shadow-sm ${getKkmColor(item.kkm)}`}>
                                            {item.kkm}
                                        </span>
                                    </TableCell>
                                    <TableCell>
                                        <div className="flex items-center gap-3">
                                            <div className="w-10 h-10 rounded-full bg-gradient-to-br from-blue-400 to-purple-600 flex items-center justify-center text-white font-bold text-sm shadow-md">
                                                {item.guru.charAt(0).toUpperCase()}
                                            </div>
                                            <span className="font-medium text-gray-700">{item.guru}</span>
                                        </div>
                                    </TableCell>
                                </TableRow>
                            ))}
                        </TableBody>
                    </Table>
                </div>

                {/* Legend Section */}
                <div className="mt-6 bg-white rounded-xl shadow-md p-5 border border-gray-100">
                    <h3 className="text-sm font-semibold text-gray-700 mb-3">Note:</h3>
                    <div className="flex flex-wrap items-center gap-6">
                        <div className="flex items-center gap-2">
                            <div className="w-4 h-4 rounded-full bg-green-500 shadow-sm"></div>
                            <span className="text-sm text-gray-700 font-medium">KKM ≥ 75 (Sangat Baik)</span>
                        </div>
                        <div className="flex items-center gap-2">
                            <div className="w-4 h-4 rounded-full bg-blue-500 shadow-sm"></div>
                            <span className="text-sm text-gray-700 font-medium">KKM 70-74 (Baik)</span>
                        </div>
                        <div className="flex items-center gap-2">
                            <div className="w-4 h-4 rounded-full bg-orange-500 shadow-sm"></div>
                            <span className="text-sm text-gray-700 font-medium">KKM &lt; 70 (Cukup)</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}