"use server"

import { prisma } from "@/lib/prisma"
import { ReportGenderOnClassByTingkat } from "../types"


export async function findGenderByTingkat(){
    try {
        const query =  await prisma.$queryRaw<ReportGenderOnClassByTingkat[]>`
            SELECT 
                k.tingkat,
                COUNT(s.id) AS "jumlah_siswa",
                COUNT(*) FILTER (WHERE s."jenisKelamin" = 'L') AS "laki_laki",
                COUNT(*) FILTER (WHERE s."jenisKelamin" = 'P') AS "perempuan"
            FROM kelas k
            LEFT JOIN siswa s ON s."kelasId" = k.id
            GROUP BY k.tingkat
            ORDER BY k.tingkat;
        ` 
        return {success : true, data : query}
 } catch (error) {
    console.error("Error fetching wali siswa:", error)
    return { success: false, error: "Gagal mengambil data siswa" }
  }
}