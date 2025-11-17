"use server"
import { prisma } from "@/lib/prisma"
import { Siswa } from "../types"

// Get all siswa
export async function findAllSiswa() : Promise<{success : boolean, data? : Siswa[],error? : string}> {
  try {
    const data = await prisma.siswa.findMany({
      include: {
        kelas: true,
        siswaWali : true 
      },
      orderBy: {
        createdAt: 'desc'
      }
    })
    return { success: true, data }
  } catch (error) {
    return { success: false, error: "Gagal mengambil data siswa" }
  }
}
