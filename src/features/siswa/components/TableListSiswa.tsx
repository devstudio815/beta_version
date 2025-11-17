// components/siswa/TableListSiswa.tsx
"use client";

import { useState } from "react";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import {
  MoreHorizontal,
  Pencil,
  Trash2,
  Eye,
  Mail,
  Phone,
  Search,
  Plus,
  UserCircle,
  Calendar,
  MapPin,
} from "lucide-react";
import { Siswa } from "../types";
import { formatDate } from "@/utils/FormatDate";

interface TableListSiswaProps {
  data: Siswa[] | undefined;
}

export function TableListSiswa({ data }: TableListSiswaProps) {
  const [searchTerm, setSearchTerm] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 5

  if (!data || data.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center py-12 text-center">
        <UserCircle className="h-12 w-12 text-muted-foreground mb-4" />
        <p className="text-muted-foreground">Tidak ada data siswa</p>
      </div>
    );
  }

  // Filter data
  const filteredData = data.filter(
    (siswa) =>
      siswa.nama.toLowerCase().includes(searchTerm.toLowerCase()) ||
      siswa.nis.includes(searchTerm) ||
      siswa.nisn.includes(searchTerm) ||
      siswa.kelas?.nama.toLowerCase().includes(searchTerm.toLowerCase())
  );

  // Pagination
  const totalPages = Math.ceil(filteredData.length / itemsPerPage);
  const startIndex = (currentPage - 1) * itemsPerPage;
  const endIndex = startIndex + itemsPerPage;
  const currentData = filteredData.slice(startIndex, endIndex);


  // Calculate age
  const calculateAge = (birthDate: string | Date): number => {
    const today = new Date();
    const birth = new Date(birthDate);
    let age = today.getFullYear() - birth.getFullYear();
    const monthDiff = today.getMonth() - birth.getMonth();
    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
      age--;
    }
    return age;
  };

  return (
    <div className="space-y-4">
      {/* Search Bar & Actions */}
      <div className="flex items-center gap-2">
        <div className="relative flex-1">
          <Search className="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground" />
          <Input
            placeholder="Cari nama, NIS, NISN, atau kelas..."
            value={searchTerm}
            onChange={(e) => {
              setSearchTerm(e.target.value);
              setCurrentPage(1);
            }}
            className="pl-8"
          />
        </div>
        <Button>
          <Plus className="mr-2 h-4 w-4" />
          Tambah Siswa
        </Button>
      </div>

      {/* Stats */}
      <div className="grid gap-4 md:grid-cols-4">
        <div className="rounded-lg border p-4">
          <div className="text-sm font-medium text-muted-foreground">Total Siswa</div>
          <div className="text-2xl font-bold">{data.length}</div>
        </div>
        <div className="rounded-lg border p-4">
          <div className="text-sm font-medium text-muted-foreground">Laki-laki</div>
          <div className="text-2xl font-bold">
            {data.filter((s) => s.jenisKelamin === "L").length}
          </div>
        </div>
        <div className="rounded-lg border p-4">
          <div className="text-sm font-medium text-muted-foreground">Perempuan</div>
          <div className="text-2xl font-bold">
            {data.filter((s) => s.jenisKelamin === "P").length}
          </div>
        </div>
        <div className="rounded-lg border p-4">
          <div className="text-sm font-medium text-muted-foreground">Hasil Pencarian</div>
          <div className="text-2xl font-bold">{filteredData.length}</div>
        </div>
      </div>

      {/* Table */}
      <div className="rounded-lg border border-gray-200 shadow-sm overflow-hidden">
        <Table>
          <TableHeader>
            <TableRow className="bg-gray-50 hover:bg-gray-50">
              <TableHead className="w-[60px] font-semibold border-r">No</TableHead>
              <TableHead className="font-semibold border-r min-w-[140px]">NIS/NISN</TableHead>
              <TableHead className="font-semibold border-r min-w-[200px]">Data Siswa</TableHead>
              <TableHead className="font-semibold border-r min-w-[180px]">Kelahiran</TableHead>
              <TableHead className="font-semibold border-r min-w-[120px]">Kelas</TableHead>
              <TableHead className="font-semibold border-r min-w-[180px]">Kontak</TableHead>
              <TableHead className="font-semibold border-r min-w-[100px]">Wali</TableHead>
              <TableHead className="font-semibold text-right min-w-[80px]">Aksi</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {currentData.length === 0 ? (
              <TableRow>
                <TableCell colSpan={8} className="h-32 text-center">
                  <div className="flex flex-col items-center justify-center text-muted-foreground">
                    <Search className="h-8 w-8 mb-2 opacity-50" />
                    <p>Tidak ada hasil yang ditemukan</p>
                  </div>
                </TableCell>
              </TableRow>
            ) : (
              currentData.map((siswa, index) => (
                <TableRow key={siswa.id} className="hover:bg-gray-50/50">
                  <TableCell className="font-semibold text-center border-r bg-gray-50/30">
                    {startIndex + index + 1}
                  </TableCell>
                  
                  {/* NIS/NISN */}
                  <TableCell className="border-r">
                    <div className="space-y-1.5 py-1">
                      <div className="flex items-center gap-2">
                        <div className="h-7 w-7 rounded-full bg-blue-100 flex items-center justify-center">
                          <span className="text-xs font-semibold text-blue-700">
                            {siswa.jenisKelamin}
                          </span>
                        </div>
                        <div className="font-mono text-sm font-semibold text-gray-900">
                          {siswa.nis}
                        </div>
                      </div>
                      <div className="pl-9 font-mono text-xs text-muted-foreground">
                        NISN: {siswa.nisn}
                      </div>
                    </div>
                  </TableCell>

                  {/* Data Siswa */}
                  <TableCell className="border-r">
                    <div className="space-y-1.5 py-1">
                      <div className="font-semibold text-gray-900">{siswa.nama}</div>
                      <Badge
                        variant={siswa.jenisKelamin === "L" ? "default" : "secondary"}
                        className="text-xs"
                      >
                        {siswa.jenisKelamin === "L" ? "🙋‍♂️ Laki-laki" : "🙋‍♀️ Perempuan"}
                      </Badge>
                    </div>
                  </TableCell>

                  {/* Kelahiran */}
                  <TableCell className="border-r">
                    <div className="space-y-1.5 py-1">
                      <div className="flex items-center gap-1.5 text-sm">
                        <div className="h-5 w-5 rounded bg-orange-100 flex items-center justify-center flex-shrink-0">
                          <MapPin className="h-3 w-3 text-orange-600" />
                        </div>
                        <span className="font-medium text-gray-900">{siswa.tempatLahir}</span>
                      </div>
                      <div className="flex items-center gap-1.5 text-sm text-muted-foreground pl-6">
                        <Calendar className="h-3 w-3" />
                        <span>{formatDate(siswa.tanggalLahir)}</span>
                      </div>
                      <div className="pl-6 text-xs font-medium text-blue-600">
                        {calculateAge(siswa.tanggalLahir)} tahun
                      </div>
                    </div>
                  </TableCell>

                  {/* Kelas */}
                  <TableCell className="border-r">
                    {siswa.kelas ? (
                      <div className="space-y-1.5 py-1">
                        <Badge variant="outline" className="font-semibold">
                          {siswa.kelas.nama}
                        </Badge>
                        <div className="text-xs text-muted-foreground">
                          📚 Tingkat {siswa.kelas.tingkat}
                        </div>
                        <div className="text-xs text-muted-foreground">
                          {siswa.kelas.tahunAjar}
                        </div>
                      </div>
                    ) : (
                      <div className="flex items-center gap-1.5 text-sm text-amber-600">
                        <div className="h-1.5 w-1.5 rounded-full bg-amber-600"></div>
                        <span>Belum ada kelas</span>
                      </div>
                    )}
                  </TableCell>

                  {/* Kontak */}
                  <TableCell className="border-r">
                    <div className="space-y-1.5 py-1">
                      {siswa.email ? (
                        <div className="flex items-start gap-1.5 text-xs">
                          <div className="h-5 w-5 rounded bg-green-100 flex items-center justify-center flex-shrink-0 mt-0.5">
                            <Mail className="h-3 w-3 text-green-600" />
                          </div>
                          <span className="break-all text-muted-foreground leading-5">
                            {siswa.email}
                          </span>
                        </div>
                      ) : null}
                      {siswa.telepon ? (
                        <div className="flex items-center gap-1.5 text-xs">
                          <div className="h-5 w-5 rounded bg-purple-100 flex items-center justify-center flex-shrink-0">
                            <Phone className="h-3 w-3 text-purple-600" />
                          </div>
                          <span className="text-muted-foreground">
                            {siswa.telepon}
                          </span>
                        </div>
                      ) : null}
                      {!siswa.email && !siswa.telepon && (
                        <div className="flex items-center gap-1.5 text-sm text-muted-foreground">
                          <div className="h-1.5 w-1.5 rounded-full bg-gray-400"></div>
                          <span>Tidak ada kontak</span>
                        </div>
                      )}
                    </div>
                  </TableCell>

                  {/* Wali */}
                  <TableCell className="border-r">
                    {siswa.siswaWali && siswa.siswaWali.length > 0 ? (
                      <div className="flex flex-col gap-1.5 py-1">
                        <div className="flex items-center gap-1.5">
                          <Badge variant="secondary" className="text-xs font-semibold">
                            👥 {siswa.siswaWali.length} Wali
                          </Badge>
                        </div>
                        {siswa.siswaWali.some((w) => w.isPrimary) && (
                          <Badge variant="outline" className="text-xs w-fit border-green-200 bg-green-50 text-green-700">
                            ✓ Wali Utama
                          </Badge>
                        )}
                      </div>
                    ) : (
                      <div className="flex items-center gap-1.5 text-sm text-amber-600">
                        <div className="h-1.5 w-1.5 rounded-full bg-amber-600"></div>
                        <span>Belum ada wali</span>
                      </div>
                    )}
                  </TableCell>

                  {/* Actions */}
                  <TableCell className="text-right">
                    <DropdownMenu>
                      <DropdownMenuTrigger asChild>
                        <Button variant="ghost" className="h-8 w-8 p-0">
                          <span className="sr-only">Open menu</span>
                          <MoreHorizontal className="h-4 w-4" />
                        </Button>
                      </DropdownMenuTrigger>
                      <DropdownMenuContent align="end">
                        <DropdownMenuLabel>Aksi</DropdownMenuLabel>
                        <DropdownMenuSeparator />
                        <DropdownMenuItem>
                          <Eye className="mr-2 h-4 w-4" />
                          Lihat Detail
                        </DropdownMenuItem>
                        <DropdownMenuItem>
                          <Pencil className="mr-2 h-4 w-4" />
                          Edit
                        </DropdownMenuItem>
                        <DropdownMenuItem>
                          <UserCircle className="mr-2 h-4 w-4" />
                          Kelola Wali
                        </DropdownMenuItem>
                        <DropdownMenuSeparator />
                        <DropdownMenuItem className="text-destructive">
                          <Trash2 className="mr-2 h-4 w-4" />
                          Hapus
                        </DropdownMenuItem>
                      </DropdownMenuContent>
                    </DropdownMenu>
                  </TableCell>
                </TableRow>
              ))
            )}
          </TableBody>
        </Table>
      </div>

      {/* Pagination */}
      {totalPages > 1 && (
        <div className="flex items-center justify-between">
          <div className="text-sm text-muted-foreground">
            Menampilkan {startIndex + 1} -{" "}
            {Math.min(endIndex, filteredData.length)} dari {filteredData.length}{" "}
            data
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
                let pageNumber;
                if (totalPages <= 5) {
                  pageNumber = i + 1;
                } else if (currentPage <= 3) {
                  pageNumber = i + 1;
                } else if (currentPage >= totalPages - 2) {
                  pageNumber = totalPages - 4 + i;
                } else {
                  pageNumber = currentPage - 2 + i;
                }
                return (
                  <Button
                    key={pageNumber}
                    variant={currentPage === pageNumber ? "default" : "outline"}
                    size="sm"
                    onClick={() => setCurrentPage(pageNumber)}
                    className="w-8"
                  >
                    {pageNumber}
                  </Button>
                );
              })}
            </div>
            <Button
              variant="outline"
              size="sm"
              onClick={() =>
                setCurrentPage((prev) => Math.min(totalPages, prev + 1))
              }
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

// ============================================
// ALTERNATIF: Versi Simple (Tanpa Search & Pagination)
// ============================================

export function TableListSiswaSimple({ data }: TableListSiswaProps) {
  if (!data || data.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center py-12 text-center">
        <UserCircle className="h-12 w-12 text-muted-foreground mb-4" />
        <p className="text-muted-foreground">Tidak ada data siswa</p>
      </div>
    );
  }

  const formatDate = (date: string | Date): string => {
    const d = new Date(date);
    return new Intl.DateTimeFormat("id-ID", {
      day: "2-digit",
      month: "short",
      year: "numeric",
    }).format(d);
  };

  return (
    <div className="rounded-md border">
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead className="w-[50px]">No</TableHead>
            <TableHead>NIS</TableHead>
            <TableHead>Nama</TableHead>
            <TableHead>L/P</TableHead>
            <TableHead>Tempat, Tgl Lahir</TableHead>
            <TableHead>Kelas</TableHead>
            <TableHead>Kontak</TableHead>
            <TableHead className="text-right">Aksi</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {data.map((siswa, index) => (
            <TableRow key={siswa.id}>
              <TableCell className="font-medium">{index + 1}</TableCell>
              <TableCell>
                <div className="font-mono text-sm">{siswa.nis}</div>
              </TableCell>
              <TableCell>
                <div className="font-medium">{siswa.nama}</div>
              </TableCell>
              <TableCell>
                <Badge
                  variant={siswa.jenisKelamin === "L" ? "default" : "secondary"}
                >
                  {siswa.jenisKelamin}
                </Badge>
              </TableCell>
              <TableCell>
                <div className="text-sm">
                  {siswa.tempatLahir}, {formatDate(siswa.tanggalLahir)}
                </div>
              </TableCell>
              <TableCell>
                {siswa.kelas ? (
                  <Badge variant="outline">{siswa.kelas.nama}</Badge>
                ) : (
                  <span className="text-sm text-muted-foreground">-</span>
                )}
              </TableCell>
              <TableCell>
                <div className="text-sm text-muted-foreground">
                  {siswa.email || siswa.telepon || "-"}
                </div>
              </TableCell>
              <TableCell className="text-right">
                <DropdownMenu>
                  <DropdownMenuTrigger asChild>
                    <Button variant="ghost" className="h-8 w-8 p-0">
                      <MoreHorizontal className="h-4 w-4" />
                    </Button>
                  </DropdownMenuTrigger>
                  <DropdownMenuContent align="end">
                    <DropdownMenuItem>
                      <Eye className="mr-2 h-4 w-4" />
                      Lihat Detail
                    </DropdownMenuItem>
                    <DropdownMenuItem>
                      <Pencil className="mr-2 h-4 w-4" />
                      Edit
                    </DropdownMenuItem>
                    <DropdownMenuSeparator />
                    <DropdownMenuItem className="text-destructive">
                      <Trash2 className="mr-2 h-4 w-4" />
                      Hapus
                    </DropdownMenuItem>
                  </DropdownMenuContent>
                </DropdownMenu>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  );
}