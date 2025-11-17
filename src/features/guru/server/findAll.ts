"use server"
import { prisma } from "@/lib/prisma"
import { Guru } from "../types"

// Get all guru
export async function findAllGuru() : Promise<{success : boolean, data? : Guru[],error? : string}> {
  try {
    const data = await prisma.guru.findMany({
      include: {
        kelasWali: true, 
      },
      orderBy: {
        createdAt: 'desc'
      }
    })
    return { success: true, data }
  } catch (error) {
    console.error("Error fetching guru:", error)
    return { success: false, error: "Gagal mengambil data guru" }
  }
}

// Get guru by ID
export async function findGuruById(id: string) {
  try {
    const data = await prisma.guru.findUnique({
      where: { id },
      include: {
        kelasWali: {
          include: {
            siswa: true // Include siswa di kelas tersebut
          }
        }
      }
    })
    return { success: true, data }
  } catch (error) {
    console.error("Error fetching guru:", error)
    return { success: false, error: "Gagal mengambil data guru" }
  }
}
