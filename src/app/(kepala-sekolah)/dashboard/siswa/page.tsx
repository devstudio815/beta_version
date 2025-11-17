import { TableListSiswa } from "@/features/siswa/components/TableListSiswa"
import { findAllSiswa } from "@/features/siswa/server/findAll"

export default async  function Page(){
    const siswa = await findAllSiswa()
    console.log(siswa)
    return (
        <div>
            <TableListSiswa data={siswa.data}/>
        </div>
    )
}