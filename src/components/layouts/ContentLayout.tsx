"use client";

import { ReactNode } from "react";
import { Menu, Bell, User } from "lucide-react";

interface ContentLayoutProps {
  children: ReactNode;
}

export function ContentLayout({ children }: ContentLayoutProps) {
  return (
    <div className="ml-64 min-h-screen bg-gray-50 dark:bg-gray-900">
      {/* Header */}
      <header className="sticky top-0 z-30 border-b border-gray-200 bg-white dark:border-gray-800 dark:bg-gray-900">
        <div className="flex h-16 items-center justify-between px-6">
          <div className="flex items-center gap-4">
            <button className="lg:hidden">
              <Menu className="h-6 w-6" />
            </button>
            <h2 className="text-lg font-semibold">Dashboard</h2>
          </div>

          <div className="flex items-center gap-4">
            <button className="relative rounded-lg p-2 hover:bg-gray-100 dark:hover:bg-gray-800">
              <Bell className="h-5 w-5" />
              <span className="absolute right-1 top-1 h-2 w-2 rounded-full bg-red-500"></span>
            </button>
            <button className="flex items-center gap-2 rounded-lg p-2 hover:bg-gray-100 dark:hover:bg-gray-800">
              <User className="h-5 w-5" />
              <span className="text-sm font-medium">Admin</span>
            </button>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="p-6">{children}</main>
    </div>
  );
}