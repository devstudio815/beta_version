export function formatDate(date: string | Date): string {
  const d = new Date(date);
  return new Intl.DateTimeFormat("id-ID", {
    day: "2-digit",
    month: "long",
    year: "numeric",
  }).format(d);
}