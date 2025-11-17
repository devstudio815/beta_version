import { LucideIcon } from "lucide-react";

export interface SidebarData {
  name: string;
  link: string;
  icon: string
  children?: SidebarData[];
}
