import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "EDUCONNECT",
  description: "EDUCONNECT APP",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>
        {children}
      </body>
    </html>
  );
}
