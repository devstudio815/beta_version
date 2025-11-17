"use server"
import { prisma } from "@/lib/prisma"
import { WaliSiswa } from "../types"

// Get all siswa with their wali
export async function findAllWaliSiswa() {
  try {
    const data = await prisma.$queryRaw<WaliSiswa[]>`
        SELECT 
            s.nama as siswa_nama,
            ws.nama as wali_nama,
            ws.pekerjaan,
            ws.nik,
            ws.hubungan,
            sw."isPrimary",
            ws.alamat,
            ws.telepon
        FROM siswa_wali sw
        LEFT JOIN siswa s ON s.id = sw."siswaId"
        LEFT JOIN wali_siswa ws ON ws.id = sw."waliSiswaId"
        ORDER BY s.nama, sw."isPrimary" DESC
    `
    return { success: true, data }
  } catch (error) {
    console.error("Error fetching wali siswa:", error)
    return { success: false, error: "Gagal mengambil data siswa" }
  }
}