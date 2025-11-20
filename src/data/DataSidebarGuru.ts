"use client"
import { SidebarData } from "@/types/layouts";
import { BarChart, BookOpen, BookOpenCheck, Calendar, ClipboardList, FileText, GraduationCap, Home, School, Settings, Users, UserSquare2 } from "lucide-react";

export const sidebarDataKepalaSekolah: SidebarData[] = [
  {
    name: "Dashboard",
    link: "/dashboard",
    icon: Home,
  },
  {
    name: "Manajemen Pengguna",
    link: "#",
    icon: Users,
    children: [
      {
        name: "Guru",
        link: "/dashboard/guru",
        icon: Users,
      },
      {
        name: "Siswa",
        link: "/dashboard/siswa",
        icon: GraduationCap,
      },
      {
        name: "Wali Siswa",
        link: "/dashboard/wali-siswa",
        icon: UserSquare2,
      },
    ],
  },
  {
    name: "Akademik",
    link: "#",
    icon: BookOpen,
    children: [
      {
        name: "Kelas",
        link: "/dashboard/kelas",
        icon: School,
      },
      {
        name: "Mata Pelajaran",
        link: "/dashboard/mata-pelajaran",
        icon: BookOpenCheck,
      },
      {
        name: "Jadwal Pelajaran",
        link: "/dashboard/jadwal",
        icon: Calendar,
      },
    ],
  },
  {
    name: "Laporan & Analisis",
    link: "#",
    icon: BarChart,
    children: [
      {
        name: "Laporan Akademik",
        link: "/dashboard/laporan/akademik",
        icon: FileText,
      },
      {
        name: "Laporan Kehadiran",
        link: "/dashboard/laporan/kehadiran",
        icon: ClipboardList,
      },
      {
        name: "Statistik Sekolah",
        link: "/dashboard/laporan/statistik",
        icon: BarChart,
      },
    ],
  },
  {
    name: "Pengaturan",
    link: "/dashboard/pengaturan",
    icon: Settings,
  },
];