"use server";
import { prisma } from "@/lib/prisma";

interface filtersFindAllJadwal {
  limit: number;
  page: number;
  search?: string;
}

export async function findAllJadwal({
  limit,
  page,
  search,
}: filtersFindAllJadwal) {
  const skip = (page - 1) * limit;

  const whereClause = {
    ...(search && {
      OR: [
        { nama: { contains: search, mode: "insensitive" as const } },
        { kode: { contains: search, mode: "insensitive" as const } },
      ],
    }),
  };

  // Jalankan query secara parallel dengan Promise.all
  const [data, count] = await Promise.all([
    prisma.mataPelajaran.findMany({
      orderBy: {
        kode: "asc",
      },
      where: whereClause,
      skip: skip,
      take: limit,
      include: {
        kelas: {
          select: {
            id: true,
            nama: true,
            tingkat: true,
          },
        },
        guru: {
          select: {
            id: true,
            nama: true,
            nip: true,
          },
        },
        jadwal: {
          select: {
            id: true,
            hari: true,
            jamMulai: true,
            jamSelesai: true,
            ruangan: true,
          },
        },
      },
    }),
    prisma.mataPelajaran.count({
      where: whereClause,
    }),
  ]);

  return {
    data,
    metadata: {
      total: count,
      page,
      limit,
      totalPages: Math.ceil(count / limit),
    },
  };
}
