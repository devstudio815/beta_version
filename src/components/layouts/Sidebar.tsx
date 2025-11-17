"use client";

import { useState } from "react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { ChevronDown, ChevronRight, LucideIcon } from "lucide-react";
import * as Icons from "lucide-react";
import { cn } from "@/lib/utils";
import { SidebarData } from "@/types/layouts";

interface SidebarProps {
  data: SidebarData[];
}

const getIconComponent = (iconName: string): LucideIcon => {
  const IconComponent = (Icons as any)[iconName];
  return IconComponent || Icons.Circle; 
};

export function Sidebar({ data }: SidebarProps) {
  const pathname = usePathname();
  const [openMenus, setOpenMenus] = useState<Set<string>>(new Set());

  const toggleMenu = (name: string) => {
    setOpenMenus((prev) => {
      const newSet = new Set(prev);
      if (newSet.has(name)) {
        newSet.delete(name);
      } else {
        newSet.add(name);
      }
      return newSet;
    });
  };

  const renderMenuItem = (item: SidebarData, level: number = 0) => {
    const hasChildren = item.children && item.children.length > 0;
    const isActive = pathname === item.link;
    const isOpen = openMenus.has(item.name);
    const Icon = getIconComponent(item.icon); // ✅ Convert string to component

    return (
      <div key={item.name} className="w-full">
        {hasChildren ? (
          <div>
            <button
              onClick={() => toggleMenu(item.name)}
              className={cn(
                "w-full flex items-center justify-between px-4 py-2.5 text-sm font-medium rounded-lg transition-colors hover:bg-gray-100 dark:hover:bg-gray-800",
                isActive && "bg-gray-100 dark:bg-gray-800 text-primary"
              )}
              style={{ paddingLeft: `${level * 16 + 16}px` }}
            >
              <div className="flex items-center gap-3">
                <Icon className="w-5 h-5" />
                <span>{item.name}</span>
              </div>
              {isOpen ? (
                <ChevronDown className="w-4 h-4" />
              ) : (
                <ChevronRight className="w-4 h-4" />
              )}
            </button>
            {isOpen && (
              <div className="mt-1 space-y-1">
                {item.children?.map((child) => renderMenuItem(child, level + 1))}
              </div>
            )}
          </div>
        ) : (
          <Link
            href={item.link}
            className={cn(
              "w-full flex items-center gap-3 px-4 py-2.5 text-sm font-medium rounded-lg transition-colors hover:bg-gray-100 dark:hover:bg-gray-800",
              isActive && "bg-gray-100 dark:bg-gray-800 text-primary"
            )}
            style={{ paddingLeft: `${level * 16 + 16}px` }}
          >
            <Icon className="w-5 h-5" />
            <span>{item.name}</span>
          </Link>
        )}
      </div>
    );
  };

  return (
    <aside className="fixed left-0 top-0 z-40 h-screen w-64 border-r border-gray-200 bg-white dark:border-gray-800 dark:bg-gray-900">
      <div className="flex h-full flex-col overflow-y-auto px-3 py-4">
        {/* Logo/Header */}
        <div className="mb-6 px-3">
          <h1 className="text-xl font-bold">Dashboard</h1>
        </div>

        {/* Menu Items */}
        <nav className="flex-1 space-y-1">
          {data.map((item) => renderMenuItem(item))}
        </nav>

        {/* Footer */}
        <div className="mt-auto border-t border-gray-200 pt-4 dark:border-gray-800">
          <div className="px-3 text-xs text-gray-500">
            © 2024 Your App
          </div>
        </div>
      </div>
    </aside>
  );
}