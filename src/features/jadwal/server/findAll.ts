"use server";
import { prisma } from "@/lib/prisma";

export async function findAllJadwal() {
  const data = await prisma.jadwal.findMany({
    include: {
      mataPelajaran: true,
    },
    orderBy: {
      kelasId: "asc",
    },
  });

  return data;
}
