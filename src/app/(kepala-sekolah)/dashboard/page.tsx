// Di page.tsx

import GenderDistributionChart from "@/features/kelas/components/KelasReport";
import { findGenderByTingkat } from "@/features/kelas/server/report";

export default async function Page() {
    const { data } = await findGenderByTingkat();
    
    if (!data) return <div>Loading...</div>;
    
    return <GenderDistributionChart data={data} />;
}