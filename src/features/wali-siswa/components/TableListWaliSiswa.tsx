"use client"
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Briefcase, ChevronDown, ChevronRight, CreditCard, MapPin, Phone, Search, Users } from "lucide-react";
import { useState } from "react";
import { WaliSiswa } from "../types";

interface TableListWaliSiswaProps {
    data: WaliSiswa[]
}

export function TableListWaliSiswa({ data }: TableListWaliSiswaProps) {
    const [searchTerm, setSearchTerm] = useState("");
    const [currentPage, setCurrentPage] = useState(1);
    const [expandedRows, setExpandedRows] = useState<Set<string>>(new Set());
    const itemsPerPage = 10;

    const toggleRow = (key: string) => {
        const newExpanded = new Set(expandedRows);
        if (newExpanded.has(key)) {
            newExpanded.delete(key);
        } else {
            newExpanded.add(key);
        }
        setExpandedRows(newExpanded);
    };

    if (!data || data.length === 0) {
        return (
            <div className="flex flex-col items-center justify-center py-12 text-center">
                <Users className="h-12 w-12 text-muted-foreground mb-4" />
                <p className="text-muted-foreground">Tidak ada data wali siswa</p>
            </div>
        );
    }

    // Group by siswa
    const groupedData = data.reduce((acc, item) => {
        if (!acc[item.siswa_nama]) {
            acc[item.siswa_nama] = [];
        }
        acc[item.siswa_nama].push(item);
        return acc;
    }, {} as Record<string, WaliSiswa[]>);

    // Filter data
    const filteredData = Object.entries(groupedData).filter(([siswa, walis]) =>
        siswa.toLowerCase().includes(searchTerm.toLowerCase()) ||
        walis.some(w => 
            w.wali_nama.toLowerCase().includes(searchTerm.toLowerCase()) ||
            w.nik.includes(searchTerm) ||
            (w.telepon && w.telepon.includes(searchTerm))
        )
    );

    // Pagination
    const totalPages = Math.ceil(filteredData.length / itemsPerPage);
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const currentData = filteredData.slice(startIndex, endIndex);

    return (
        <div className="space-y-4">
            {/* Search Bar */}
            <div className="flex items-center gap-2">
                <div className="relative flex-1">
                    <Search className="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground" />
                    <Input
                        placeholder="Cari nama siswa, wali, NIK, atau telepon..."
                        value={searchTerm}
                        onChange={(e) => {
                            setSearchTerm(e.target.value);
                            setCurrentPage(1);
                        }}
                        className="pl-8"
                    />
                </div>
            </div>

            {/* Table */}
            <div className="rounded-lg border-2 border-border overflow-hidden">
                <Table>
                    <TableHeader>
                        <TableRow className="bg-muted/50 hover:bg-muted/50">
                            <TableHead className="w-[50px] font-semibold">No</TableHead>
                            <TableHead className="font-semibold">Nama Siswa</TableHead>
                            <TableHead className="font-semibold">Wali Utama</TableHead>
                            <TableHead className="font-semibold">Hubungan</TableHead>
                            <TableHead className="font-semibold">Kontak</TableHead>
                            <TableHead className="font-semibold">Jumlah Wali</TableHead>
                            <TableHead className="text-center font-semibold">Aksi</TableHead>
                        </TableRow>
                    </TableHeader>
                    <TableBody>
                        {currentData.length === 0 ? (
                            <TableRow>
                                <TableCell colSpan={7} className="h-24 text-center">
                                    Tidak ada hasil yang ditemukan
                                </TableCell>
                            </TableRow>
                        ) : (
                            currentData.map(([siswa, walis], index) => {
                                const primaryWali = walis.find(w => w.isPrimary) || walis[0];
                                const rowKey = `${siswa}-${index}`;
                                
                                return (
                                    <>
                                        <TableRow key={rowKey} className="border-b-2">
                                            <TableCell className="font-medium">
                                                {startIndex + index + 1}
                                            </TableCell>
                                            <TableCell>
                                                <div className="font-semibold">{siswa}</div>
                                            </TableCell>
                                            <TableCell>
                                                <div className="flex items-center gap-2">
                                                    <span className="font-medium">{primaryWali.wali_nama}</span>
                                                    {primaryWali.isPrimary && (
                                                        <Badge variant="default" className="text-xs">
                                                            Utama
                                                        </Badge>
                                                    )}
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                <Badge variant="outline" className="capitalize">
                                                    {primaryWali.hubungan}
                                                </Badge>
                                            </TableCell>
                                            <TableCell>
                                                <div className="space-y-1">
                                                    {primaryWali.telepon && (
                                                        <div className="flex items-center gap-2 text-sm">
                                                            <Phone className="h-3 w-3 text-muted-foreground" />
                                                            <span className="text-muted-foreground">
                                                                {primaryWali.telepon}
                                                            </span>
                                                        </div>
                                                    )}
                                                    <div className="flex items-center gap-2 text-sm">
                                                        <CreditCard className="h-3 w-3 text-muted-foreground" />
                                                        <span className="text-muted-foreground font-mono text-xs">
                                                            {primaryWali.nik}
                                                        </span>
                                                    </div>
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                <Badge variant="secondary" className="font-semibold">
                                                    {walis.length} Wali
                                                </Badge>
                                            </TableCell>
                                            <TableCell className="text-center">
                                                <Button
                                                    variant="ghost"
                                                    size="sm"
                                                    className="h-8 w-8 p-0"
                                                    onClick={() => toggleRow(rowKey)}
                                                >
                                                    {expandedRows.has(rowKey) ? (
                                                        <ChevronDown className="h-4 w-4" />
                                                    ) : (
                                                        <ChevronRight className="h-4 w-4" />
                                                    )}
                                                </Button>
                                            </TableCell>
                                        </TableRow>
                                        {expandedRows.has(rowKey) && (
                                            <TableRow className="bg-muted/30 border-b-2">
                                                <TableCell colSpan={7} className="p-0">
                                                    <div className="p-4 pl-8">
                                                        <h4 className="font-semibold mb-3 text-sm flex items-center gap-2">
                                                            <Users className="h-4 w-4" />
                                                            Detail Semua Wali:
                                                        </h4>
                                                        <div className="rounded-lg border-2 border-border overflow-hidden">
                                                            <Table>
                                                                <TableHeader>
                                                                    <TableRow className="bg-muted/50 hover:bg-muted/50">
                                                                        <TableHead className="font-semibold">Nama Wali</TableHead>
                                                                        <TableHead className="font-semibold">Status</TableHead>
                                                                        <TableHead className="font-semibold">NIK</TableHead>
                                                                        <TableHead className="font-semibold">Pekerjaan</TableHead>
                                                                        <TableHead className="font-semibold">Telepon</TableHead>
                                                                        <TableHead className="font-semibold">Alamat</TableHead>
                                                                    </TableRow>
                                                                </TableHeader>
                                                                <TableBody>
                                                                    {walis.map((wali, idx) => (
                                                                        <TableRow key={idx}>
                                                                            <TableCell className="font-medium">
                                                                                {wali.wali_nama}
                                                                            </TableCell>
                                                                            <TableCell>
                                                                                <div className="flex gap-2">
                                                                                    {wali.isPrimary && (
                                                                                        <Badge variant="default" className="text-xs">
                                                                                            Utama
                                                                                        </Badge>
                                                                                    )}
                                                                                    <Badge variant="outline" className="capitalize text-xs">
                                                                                        {wali.hubungan}
                                                                                    </Badge>
                                                                                </div>
                                                                            </TableCell>
                                                                            <TableCell>
                                                                                <div className="font-mono text-sm">{wali.nik}</div>
                                                                            </TableCell>
                                                                            <TableCell>
                                                                                <div className="flex items-center gap-2">
                                                                                    {wali.pekerjaan ? (
                                                                                        <>
                                                                                            <Briefcase className="h-3 w-3 text-muted-foreground" />
                                                                                            <span className="text-sm">{wali.pekerjaan}</span>
                                                                                        </>
                                                                                    ) : (
                                                                                        <span className="text-sm text-muted-foreground">-</span>
                                                                                    )}
                                                                                </div>
                                                                            </TableCell>
                                                                            <TableCell>
                                                                                {wali.telepon ? (
                                                                                    <div className="flex items-center gap-2">
                                                                                        <Phone className="h-3 w-3 text-muted-foreground" />
                                                                                        <span className="text-sm">{wali.telepon}</span>
                                                                                    </div>
                                                                                ) : (
                                                                                    <span className="text-sm text-muted-foreground">-</span>
                                                                                )}
                                                                            </TableCell>
                                                                            <TableCell>
                                                                                {wali.alamat ? (
                                                                                    <div className="flex items-start gap-2 max-w-[300px]">
                                                                                        <MapPin className="h-3 w-3 text-muted-foreground mt-1 flex-shrink-0" />
                                                                                        <span className="text-sm text-muted-foreground">
                                                                                            {wali.alamat}
                                                                                        </span>
                                                                                    </div>
                                                                                ) : (
                                                                                    <span className="text-sm text-muted-foreground">-</span>
                                                                                )}
                                                                            </TableCell>
                                                                        </TableRow>
                                                                    ))}
                                                                </TableBody>
                                                            </Table>
                                                        </div>
                                                    </div>
                                                </TableCell>
                                            </TableRow>
                                        )}
                                    </>
                                );
                            })
                        )}
                    </TableBody>
                </Table>
            </div>

            {/* Pagination */}
            {totalPages > 1 && (
                <div className="flex items-center justify-between pt-2">
                    <div className="text-sm text-muted-foreground">
                        Menampilkan {startIndex + 1} - {Math.min(endIndex, filteredData.length)}{" "}
                        dari {filteredData.length} siswa
                    </div>
                    <div className="flex items-center gap-2">
                        <Button
                            variant="outline"
                            size="sm"
                            onClick={() => setCurrentPage((prev) => Math.max(1, prev - 1))}
                            disabled={currentPage === 1}
                        >
                            Sebelumnya
                        </Button>
                        <div className="flex items-center gap-1">
                            {Array.from({ length: Math.min(totalPages, 5) }, (_, i) => {
                                let pageNum;
                                if (totalPages <= 5) {
                                    pageNum = i + 1;
                                } else if (currentPage <= 3) {
                                    pageNum = i + 1;
                                } else if (currentPage >= totalPages - 2) {
                                    pageNum = totalPages - 4 + i;
                                } else {
                                    pageNum = currentPage - 2 + i;
                                }
                                return (
                                    <Button
                                        key={pageNum}
                                        variant={currentPage === pageNum ? "default" : "outline"}
                                        size="sm"
                                        onClick={() => setCurrentPage(pageNum)}
                                        className="w-8"
                                    >
                                        {pageNum}
                                    </Button>
                                );
                            })}
                        </div>
                        <Button
                            variant="outline"
                            size="sm"
                            onClick={() => setCurrentPage((prev) => Math.min(totalPages, prev + 1))}
                            disabled={currentPage === totalPages}
                        >
                            Selanjutnya
                        </Button>
                    </div>
                </div>
            )}
        </div>
    );
}