import { TableListGuru } from "@/features/guru/components/TableListGuru"
import { findAllGuru } from "@/features/guru/server/findAll"
import { Guru } from "@/generated/prisma"

export default async function Page(){
    const data  = await  findAllGuru()
        return (
        <div>
            <TableListGuru data={data.data}/>
        </div>
    )
}