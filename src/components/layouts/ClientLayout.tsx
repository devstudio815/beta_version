"use client";

import { Sidebar } from "@/components/layouts/Sidebar";
import { ContentLayout } from "@/components/layouts/ContentLayout";
import { ReactNode } from "react";
import { SidebarData } from "@/types/layouts";

interface ClientLayoutProps {
  children: ReactNode;
  sidebarData: SidebarData[];
}

export function ClientLayout({ children, sidebarData }: ClientLayoutProps) {
  return (
    <>
      <Sidebar data={sidebarData} />
      <ContentLayout>{children}</ContentLayout>
    </>
  );
}