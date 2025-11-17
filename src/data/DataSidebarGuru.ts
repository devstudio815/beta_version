import { SidebarData } from "@/types/layouts";
import {
    BarChart,
    BookOpen,
    GraduationCap,
    Home,
    Settings,
    Users,
    UserSquare2
} from "lucide-react";

export const sidebarDataGuru: SidebarData[] = [
  {
    name: "Dashboard",
    link: "/dashboard",
    icon: "Home",
  },
  {
    name: "Users",
    link: "#",
    icon: "BookOpen",
    children: [
      {
        name: "Guru",
        link: "/dashboard/guru",
        icon: "Users",
      },
      {
        name: "Siswa",
        link: "/dashboard/siswa",
        icon: "GraduationCap",
      },
      {
        name: "Kelas",
        link: "/dashboard/kelas",
        icon: "BookOpen",
      },
      {
        name: "Wali Siswa",
        link: "/dashboard/wali-siswa",
        icon: "UserSquare2",
      },
    ],
  },
  {
    name: "Laporan",
    link: "/laporan",
    icon: "BarChart",
  },
  {
    name: "Pengaturan",
    link: "/pengaturan",
    icon: "Settings",
  },
];
