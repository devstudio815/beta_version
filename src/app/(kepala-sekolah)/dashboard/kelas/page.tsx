import { TableListKelas } from "@/features/kelas/components/TableListKelas"
import { findAllKelas } from "@/features/kelas/server/kelas"

export default async function Page(){
    const kelas = await findAllKelas()
    return (
        <div>
            <TableListKelas data={kelas.data}/>
        </div>
    )
}