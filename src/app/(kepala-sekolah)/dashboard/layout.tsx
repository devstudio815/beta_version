import { ClientLayout } from "@/components/layouts/ClientLayout";
import { sidebarDataGuru } from "@/data/DataSidebarGuru";
import { ReactNode } from "react";

export default function DashboardLayout({ children }: { children: ReactNode }) {
  return <ClientLayout sidebarData={sidebarDataGuru}>{children}</ClientLayout>;
}