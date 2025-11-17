"use server"
import { prisma } from "@/lib/prisma"
import { Kelas } from "../types";

export async function findAllKelas() : Promise<{success : boolean; data? : Kelas[]; error? : string}> {
  try {
    const data = await prisma.kelas.findMany({
      include: {
        siswa : true
      },
      orderBy: {
        tingkat : "asc"
      }
    })
    return { success: true, data }
  } catch (error) {
    console.error("Error fetching Kelas:", error)
    return { success: false, error: "Gagal mengambil data Kelas" }
  }
}
