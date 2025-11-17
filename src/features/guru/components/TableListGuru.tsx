"use client"
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Guru } from "../types";
import { useState } from "react";
import { Input } from "@/components/ui/input";
import { ChevronDown, ChevronRight, Eye, Mail, MoreHorizontal, Pencil, Phone, Plus, Search, Trash2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuLabel, DropdownMenuSeparator, DropdownMenuTrigger } from "@/components/ui/dropdown-menu";

interface TableListGuruProps {
    data: Guru[] | undefined
}

export function TableListGuru({ data }: TableListGuruProps) {
  const [searchTerm, setSearchTerm] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [expandedRows, setExpandedRows] = useState<Set<string>>(new Set());
  const itemsPerPage = 10;

  const toggleRow = (id: string) => {
    const newExpanded = new Set(expandedRows);
    if (newExpanded.has(id)) {
      newExpanded.delete(id);
    } else {
      newExpanded.add(id);
    }
    setExpandedRows(newExpanded);
  };

  if (!data || data.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center py-12 text-center">
        <p className="text-muted-foreground">Tidak ada data guru</p>
      </div>
    );
  }

  // Filter data
  const filteredData = data.filter(
    (guru) =>
      guru.nama.toLowerCase().includes(searchTerm.toLowerCase()) ||
      guru.nip.includes(searchTerm) ||
      guru.email.toLowerCase().includes(searchTerm.toLowerCase())
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
            placeholder="Cari nama, NIP, atau email..."
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
          Tambah Guru
        </Button>
      </div>

      {/* Table */}
      <div className="rounded-lg border-2 border-border overflow-hidden">
        <Table>
          <TableHeader>
            <TableRow className="bg-muted/50 hover:bg-muted/50">
              <TableHead className="w-[50px] font-semibold">No</TableHead>
              <TableHead className="font-semibold">NIP</TableHead>
              <TableHead className="font-semibold">Nama</TableHead>
              <TableHead className="font-semibold">Kontak</TableHead>
              <TableHead className="font-semibold">Alamat</TableHead>
              <TableHead className="font-semibold">Wali Kelas</TableHead>
              <TableHead className="text-right font-semibold">Aksi</TableHead>
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
              currentData.map((guru, index) => (
                <>
                  <TableRow key={guru.id} className="border-b-2">
                    <TableCell className="font-medium">
                      {startIndex + index + 1}
                    </TableCell>
                    <TableCell>
                      <div className="font-mono text-sm font-medium">{guru.nip}</div>
                    </TableCell>
                    <TableCell>
                      <div className="font-semibold">{guru.nama}</div>
                    </TableCell>
                    <TableCell>
                      <div className="space-y-1">
                        <div className="flex items-center gap-2 text-sm">
                          <Mail className="h-3 w-3 text-muted-foreground" />
                          <span className="text-muted-foreground">{guru.email}</span>
                        </div>
                        {guru.telepon && (
                          <div className="flex items-center gap-2 text-sm">
                            <Phone className="h-3 w-3 text-muted-foreground" />
                            <span className="text-muted-foreground">
                              {guru.telepon}
                            </span>
                          </div>
                        )}
                      </div>
                    </TableCell>
                    <TableCell>
                      <div className="max-w-[200px] truncate text-sm text-muted-foreground">
                        {guru.alamat || "-"}
                      </div>
                    </TableCell>
                    <TableCell>
                      {guru.kelasWali && guru.kelasWali.length > 0 ? (
                        <div className="flex items-center gap-2">
                          <Badge variant="outline" className="font-semibold">
                            {guru.kelasWali.length} Kelas
                          </Badge>
                          <Button
                            variant="ghost"
                            size="sm"
                            className="h-6 w-6 p-0"
                            onClick={() => toggleRow(guru.id)}
                          >
                            {expandedRows.has(guru.id) ? (
                              <ChevronDown className="h-4 w-4" />
                            ) : (
                              <ChevronRight className="h-4 w-4" />
                            )}
                          </Button>
                        </div>
                      ) : (
                        <span className="text-sm text-muted-foreground">-</span>
                      )}
                    </TableCell>
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
                          <DropdownMenuSeparator />
                          <DropdownMenuItem className="text-destructive">
                            <Trash2 className="mr-2 h-4 w-4" />
                            Hapus
                          </DropdownMenuItem>
                        </DropdownMenuContent>
                      </DropdownMenu>
                    </TableCell>
                  </TableRow>
                  {expandedRows.has(guru.id) && guru.kelasWali && guru.kelasWali.length > 0 && (
                    <TableRow className="bg-muted/30 border-b-2">
                      <TableCell colSpan={7} className="py-4">
                        <div className="pl-8">
                          <h4 className="font-semibold mb-3 text-sm">Detail Wali Kelas:</h4>
                          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                            {guru.kelasWali.map((kelas) => (
                              <div
                                key={kelas.id}
                                className="border-2 border-border rounded-lg p-3 bg-background"
                              >
                                <div className="flex items-center justify-between mb-2">
                                  <Badge variant="default" className="font-semibold">
                                    {kelas.nama}
                                  </Badge>
                                  <span className="text-xs text-muted-foreground">
                                    Tingkat {kelas.tingkat}
                                  </span>
                                </div>
                                <div className="text-xs text-muted-foreground">
                                  Tahun Ajar: {kelas.tahunAjar}
                                </div>
                              </div>
                            ))}
                          </div>
                        </div>
                      </TableCell>
                    </TableRow>
                  )}
                </>
              ))
            )}
          </TableBody>
        </Table>
      </div>

      {/* Pagination */}
      {totalPages > 1 && (
        <div className="flex items-center justify-between pt-2">
          <div className="text-sm text-muted-foreground">
            Menampilkan {startIndex + 1} - {Math.min(endIndex, filteredData.length)}{" "}
            dari {filteredData.length} data
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
              {Array.from({ length: totalPages }, (_, i) => i + 1).map((page) => (
                <Button
                  key={page}
                  variant={currentPage === page ? "default" : "outline"}
                  size="sm"
                  onClick={() => setCurrentPage(page)}
                  className="w-8"
                >
                  {page}
                </Button>
              ))}
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