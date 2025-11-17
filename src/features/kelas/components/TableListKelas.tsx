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
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import {
  ChevronDown,
  ChevronRight,
  MoreHorizontal,
  Pencil,
  Trash2,
  Eye,
  Users,
  UserPlus,
  GraduationCap,
  Calendar,
  BookOpen,
} from "lucide-react";
import { Kelas } from "../types";
import { formatDate } from "@/utils/FormatDate";

interface TableListKelasProps {
  data: Kelas[] | undefined;
}

export function TableListKelas({ data }: TableListKelasProps) {
  const [expandedRows, setExpandedRows] = useState<Set<string>>(new Set());

  if (!data || data.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center py-12 text-center">
        <BookOpen className="h-12 w-12 text-muted-foreground mb-4" />
        <p className="text-muted-foreground">Tidak ada data kelas</p>
      </div>
    );
  }

  const toggleRow = (kelasId: string) => {
    setExpandedRows((prev) => {
      const newSet = new Set(prev);
      if (newSet.has(kelasId)) {
        newSet.delete(kelasId);
      } else {
        newSet.add(kelasId);
      }
      return newSet;
    });
  };



  const calculateAge = (birthDate: Date): number => {
    const today = new Date();
    const birth = new Date(birthDate);
    let age = today.getFullYear() - birth.getFullYear();
    const monthDiff = today.getMonth() - birth.getMonth();
    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
      age--;
    }
    return age;
  };

  // Stats
  const totalSiswa = data.reduce((acc, kelas) => acc + kelas.siswa.length, 0);
  const kelasWithSiswa = data.filter((k) => k.siswa.length > 0).length;

  return (
    <div className="space-y-4">
      {/* Stats Cards */}
      <div className="grid gap-4 md:grid-cols-4">
        <div className="rounded-lg border p-4">
          <div className="text-sm font-medium text-muted-foreground">Total Kelas</div>
          <div className="text-2xl font-bold">{data.length}</div>
        </div>
        <div className="rounded-lg border p-4">
          <div className="text-sm font-medium text-muted-foreground">Kelas Terisi</div>
          <div className="text-2xl font-bold">{kelasWithSiswa}</div>
        </div>
        <div className="rounded-lg border p-4">
          <div className="text-sm font-medium text-muted-foreground">Total Siswa</div>
          <div className="text-2xl font-bold">{totalSiswa}</div>
        </div>
        <div className="rounded-lg border p-4">
          <div className="text-sm font-medium text-muted-foreground">Rata-rata/Kelas</div>
          <div className="text-2xl font-bold">
            {data.length > 0 ? Math.round(totalSiswa / data.length) : 0}
          </div>
        </div>
      </div>

      {/* Table */}
      <div className="rounded-lg border border-gray-200 shadow-sm overflow-hidden">
        <Table>
          <TableHeader>
            <TableRow className="bg-gray-50 hover:bg-gray-50">
              <TableHead className="w-[50px] font-semibold border-r"></TableHead>
              <TableHead className="w-[60px] font-semibold border-r">No</TableHead>
              <TableHead className="font-semibold border-r min-w-[200px]">
                Nama Kelas
              </TableHead>
              <TableHead className="font-semibold border-r">Tingkat</TableHead>
              <TableHead className="font-semibold border-r">Tahun Ajaran</TableHead>
              <TableHead className="font-semibold border-r">Jumlah Siswa</TableHead>
              <TableHead className="font-semibold border-r">Wali Kelas</TableHead>
              <TableHead className="font-semibold text-right">Aksi</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {data.map((kelas, index) => {
              const isExpanded = expandedRows.has(kelas.id);
              const jumlahLakiLaki = kelas.siswa.filter(
                (s) => s.jenisKelamin === "L"
              ).length;
              const jumlahPerempuan = kelas.siswa.filter(
                (s) => s.jenisKelamin === "P"
              ).length;

              return (
                <>
                  {/* Main Row */}
                  <TableRow key={kelas.id} className="hover:bg-gray-50/50">
                    <TableCell className="border-r">
                      {kelas.siswa.length > 0 && (
                        <Button
                          variant="ghost"
                          size="sm"
                          className="h-8 w-8 p-0"
                          onClick={() => toggleRow(kelas.id)}
                        >
                          {isExpanded ? (
                            <ChevronDown className="h-4 w-4" />
                          ) : (
                            <ChevronRight className="h-4 w-4" />
                          )}
                        </Button>
                      )}
                    </TableCell>

                    <TableCell className="font-semibold text-center border-r bg-gray-50/30">
                      {index + 1}
                    </TableCell>

                    <TableCell className="border-r">
                      <div className="flex items-center gap-3">
                        <div className="h-10 w-10 rounded-lg bg-blue-100 flex items-center justify-center">
                          <GraduationCap className="h-5 w-5 text-blue-600" />
                        </div>
                        <div>
                          <div className="font-semibold text-gray-900">
                            {kelas.nama}
                          </div>
                        
                        </div>
                      </div>
                    </TableCell>

                    <TableCell className="border-r">
                      <Badge variant="outline" className="font-semibold">
                        Tingkat {kelas.tingkat}
                      </Badge>
                    </TableCell>

                    <TableCell className="border-r">
                      <div className="flex items-center gap-1.5">
                        <Calendar className="h-4 w-4 text-muted-foreground" />
                        <span className="font-medium">{kelas.tahunAjar}</span>
                      </div>
                    </TableCell>

                    <TableCell className="border-r">
                      <div className="space-y-1">
                        <div className="flex items-center gap-1.5">
                          <Users className="h-4 w-4 text-blue-600" />
                          <span className="font-semibold text-blue-600">
                            {kelas.siswa.length} Siswa
                          </span>
                        </div>
                        {kelas.siswa.length > 0 && (
                          <div className="flex gap-1">
                            <Badge variant="secondary" className="text-xs">
                              🙋‍♂️ {jumlahLakiLaki}
                            </Badge>
                            <Badge variant="secondary" className="text-xs">
                              🙋‍♀️ {jumlahPerempuan}
                            </Badge>
                          </div>
                        )}
                      </div>
                    </TableCell>

                    <TableCell className="border-r">
                      {kelas.waliKelasId ? (
                        <Badge variant="outline" className="bg-green-50 text-green-700 border-green-200">
                          ✓ Ada Wali
                        </Badge>
                      ) : (
                        <div className="flex items-center gap-1.5 text-sm text-amber-600">
                          <div className="h-1.5 w-1.5 rounded-full bg-amber-600"></div>
                          <span>Belum ada wali</span>
                        </div>
                      )}
                    </TableCell>

                    <TableCell className="text-right">
                      <DropdownMenu>
                        <DropdownMenuTrigger asChild>
                          <Button variant="ghost" className="h-8 w-8 p-0">
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
                            <UserPlus className="mr-2 h-4 w-4" />
                            Tambah Siswa
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

                  {/* Expanded Row - Daftar Siswa */}
                  {isExpanded && kelas.siswa.length > 0 && (
                    <TableRow className="bg-blue-50/30">
                      <TableCell colSpan={8} className="p-0">
                        <div className="px-4 py-3">
                          <div className="mb-3 flex items-center justify-between">
                            <h4 className="font-semibold text-sm text-gray-900">
                              📋 Daftar Siswa Kelas {kelas.nama}
                            </h4>
                            <Badge variant="secondary">
                              {kelas.siswa.length} Siswa
                            </Badge>
                          </div>

                          <div className="rounded-lg border bg-white overflow-hidden">
                            <Table>
                              <TableHeader>
                                <TableRow className="bg-gray-50">
                                  <TableHead className="w-[50px]">No</TableHead>
                                  <TableHead>NIS</TableHead>
                                  <TableHead>Nama Siswa</TableHead>
                                  <TableHead>L/P</TableHead>
                                  <TableHead>Tempat, Tgl Lahir</TableHead>
                                  <TableHead>Usia</TableHead>
                                  <TableHead>Kontak</TableHead>
                                </TableRow>
                              </TableHeader>
                              <TableBody>
                                {kelas.siswa.map((siswa, siswaIndex) => (
                                  <TableRow key={siswa.id}>
                                    <TableCell className="font-medium text-center">
                                      {siswaIndex + 1}
                                    </TableCell>
                                    <TableCell>
                                      <div className="font-mono text-xs">
                                        {siswa.nis}
                                      </div>
                                    </TableCell>
                                    <TableCell>
                                      <div className="font-medium">
                                        {siswa.nama}
                                      </div>
                                    </TableCell>
                                    <TableCell>
                                      <Badge
                                        variant={
                                          siswa.jenisKelamin === "L"
                                            ? "default"
                                            : "secondary"
                                        }
                                        className="text-xs"
                                      >
                                        {siswa.jenisKelamin === "L" ? "🙋‍♂️" : "🙋‍♀️"}
                                      </Badge>
                                    </TableCell>
                                    <TableCell>
                                      <div className="text-sm">
                                        {siswa.tempatLahir},{" "}
                                        {formatDate(siswa.tanggalLahir)}
                                      </div>
                                    </TableCell>
                                    <TableCell>
                                      <Badge variant="outline" className="text-xs">
                                        {calculateAge(siswa.tanggalLahir)} tahun
                                      </Badge>
                                    </TableCell>
                                    <TableCell>
                                      <div className="text-xs text-muted-foreground space-y-1">
                                        {siswa.email && (
                                          <div className="truncate max-w-[150px]">
                                            📧 {siswa.email}
                                          </div>
                                        )}
                                        {siswa.telepon && (
                                          <div>📱 {siswa.telepon}</div>
                                        )}
                                        {!siswa.email && !siswa.telepon && "-"}
                                      </div>
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
            })}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}