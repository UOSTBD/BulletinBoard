import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "UOSTBD 게시판",
  description: "웹 개발 연습용으로 제작",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ko" data-theme="light">
      <body>{children}</body>
    </html>
  );
}
