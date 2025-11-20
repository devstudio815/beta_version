import { ClientLayout } from "@/components/layouts/ClientLayout";
import { sidebarDataKepalaSekolah } from "@/data/DataSidebarGuru";
import { ReactNode } from "react";

export default function DashboardLayout({ children }: { children: ReactNode }) {
  return <ClientLayout sidebarData={sidebarDataKepalaSekolah}>{children}</ClientLayout>;
}