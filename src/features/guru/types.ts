export interface Guru {
    id: string
      nip: string
      nama: string
      email:string
      telepon: string | null
      alamat: string | null
      createdAt:string | Date
      updatedAt:string | Date
      kelasWali : { id: string; createdAt: Date; nama: string; updatedAt: Date; tingkat: number; tahunAjar: string; waliKelasId: string | null; }[]
}