import { TableListWaliSiswa } from "@/features/wali-siswa/components/TableListWaliSiswa";
import { findAllWaliSiswa } from "@/features/wali-siswa/server/findAll";
import { WaliSiswa } from "@/features/wali-siswa/types";

export default async function Page(){
    const data = await findAllWaliSiswa()
    console.log(data)
    return (
      <div>
        <TableListWaliSiswa data={data.data as WaliSiswa[]}/>
      </div>
    )
}