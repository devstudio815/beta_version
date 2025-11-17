"use client"
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, PieChart, Pie, Cell, LineChart, Line } from 'recharts';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Users, TrendingUp } from "lucide-react";

interface ReportGenderOnClassByTingkat {
    tingkat: number;
    jumlah_siswa: number;
    laki_laki: number;
    perempuan: number;
}

interface GenderChartProps {
    data: ReportGenderOnClassByTingkat[];
}

const COLORS = {
    lakiLaki: '#3b82f6', 
    perempuan: '#ec4899',
    total: '#8b5cf6' 
};

export default function GenderDistributionChart({ data }: GenderChartProps) {
    // Transform data for charts
    const chartData = data.map(item => ({
        tingkat: `Kelas ${item.tingkat}`,
        'Laki-laki': Number(item.laki_laki),
        'Perempuan': Number(item.perempuan),
        'Total': Number(item.jumlah_siswa)
    }));

    // Calculate totals for pie chart
    const totalLakiLaki = data.reduce((sum, item) => sum + Number(item.laki_laki), 0);
    const totalPerempuan = data.reduce((sum, item) => sum + Number(item.perempuan), 0);
    const totalSiswa = totalLakiLaki + totalPerempuan;

    const pieData = [
        { name: 'Laki-laki', value: totalLakiLaki },
        { name: 'Perempuan', value: totalPerempuan }
    ];

    // Calculate statistics
    const stats = {
        totalSiswa,
        totalLakiLaki,
        totalPerempuan,
        percentageLakiLaki: ((totalLakiLaki / totalSiswa) * 100).toFixed(1),
        percentagePerempuan: ((totalPerempuan / totalSiswa) * 100).toFixed(1),
        averagePerTingkat: (totalSiswa / data.length).toFixed(0)
    };

    return (
        <div className="space-y-6 p-6">
            {/* Summary Cards */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                <Card>
                    <CardHeader className="pb-2">
                        <CardDescription>Total Siswa</CardDescription>
                        <CardTitle className="text-3xl">{stats.totalSiswa}</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="flex items-center gap-2 text-sm text-muted-foreground">
                            <Users className="h-4 w-4" />
                            <span>Semua Tingkat</span>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader className="pb-2">
                        <CardDescription>Siswa Laki-laki</CardDescription>
                        <CardTitle className="text-3xl text-blue-600">{stats.totalLakiLaki}</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="flex items-center gap-2 text-sm text-muted-foreground">
                            <TrendingUp className="h-4 w-4" />
                            <span>{stats.percentageLakiLaki}% dari total</span>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader className="pb-2">
                        <CardDescription>Siswa Perempuan</CardDescription>
                        <CardTitle className="text-3xl text-pink-600">{stats.totalPerempuan}</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="flex items-center gap-2 text-sm text-muted-foreground">
                            <TrendingUp className="h-4 w-4" />
                            <span>{stats.percentagePerempuan}% dari total</span>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader className="pb-2">
                        <CardDescription>Rata-rata per Tingkat</CardDescription>
                        <CardTitle className="text-3xl text-violet-600">{stats.averagePerTingkat}</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="flex items-center gap-2 text-sm text-muted-foreground">
                            <Users className="h-4 w-4" />
                            <span>Siswa per tingkat</span>
                        </div>
                    </CardContent>
                </Card>
            </div>

            {/* Charts Grid */}
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                {/* Bar Chart - Stacked */}
                <Card>
                    <CardHeader>
                        <CardTitle>Distribusi Gender per Tingkat</CardTitle>
                        <CardDescription>Perbandingan jumlah siswa laki-laki dan perempuan</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <ResponsiveContainer width="100%" height={300}>
                            <BarChart data={chartData}>
                                <CartesianGrid strokeDasharray="3 3" />
                                <XAxis dataKey="tingkat" />
                                <YAxis />
                                <Tooltip />
                                <Legend />
                                <Bar dataKey="Laki-laki" stackId="a" fill={COLORS.lakiLaki} />
                                <Bar dataKey="Perempuan" stackId="a" fill={COLORS.perempuan} />
                            </BarChart>
                        </ResponsiveContainer>
                    </CardContent>
                </Card>

                {/* Pie Chart */}
                <Card>
                    <CardHeader>
                        <CardTitle>Rasio Gender Keseluruhan</CardTitle>
                        <CardDescription>Persentase siswa laki-laki dan perempuan</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <ResponsiveContainer width="100%" height={300}>
                            <PieChart>
                                <Pie
                                    data={pieData}
                                    cx="50%"
                                    cy="50%"
                                    labelLine={false}
                                    label={({ name, percent }) => `${name}: ${(percent as number * 100).toFixed(1)}%`}
                                    outerRadius={100}
                                    fill="#8884d8"
                                    dataKey="value"
                                >
                                    <Cell fill={COLORS.lakiLaki} />
                                    <Cell fill={COLORS.perempuan} />
                                </Pie>
                                <Tooltip />
                            </PieChart>
                        </ResponsiveContainer>
                    </CardContent>
                </Card>

                {/* Bar Chart - Grouped */}
                <Card>
                    <CardHeader>
                        <CardTitle>Perbandingan Gender (Side by Side)</CardTitle>
                        <CardDescription>Visualisasi perbandingan langsung antar gender</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <ResponsiveContainer width="100%" height={300}>
                            <BarChart data={chartData}>
                                <CartesianGrid strokeDasharray="3 3" />
                                <XAxis dataKey="tingkat" />
                                <YAxis />
                                <Tooltip />
                                <Legend />
                                <Bar dataKey="Laki-laki" fill={COLORS.lakiLaki} />
                                <Bar dataKey="Perempuan" fill={COLORS.perempuan} />
                            </BarChart>
                        </ResponsiveContainer>
                    </CardContent>
                </Card>

                {/* Line Chart */}
                <Card>
                    <CardHeader>
                        <CardTitle>Tren Jumlah Siswa per Tingkat</CardTitle>
                        <CardDescription>Grafik garis untuk melihat pola distribusi</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <ResponsiveContainer width="100%" height={300}>
                            <LineChart data={chartData}>
                                <CartesianGrid strokeDasharray="3 3" />
                                <XAxis dataKey="tingkat" />
                                <YAxis />
                                <Tooltip />
                                <Legend />
                                <Line 
                                    type="monotone" 
                                    dataKey="Laki-laki" 
                                    stroke={COLORS.lakiLaki} 
                                    strokeWidth={2}
                                    dot={{ fill: COLORS.lakiLaki, r: 5 }}
                                />
                                <Line 
                                    type="monotone" 
                                    dataKey="Perempuan" 
                                    stroke={COLORS.perempuan} 
                                    strokeWidth={2}
                                    dot={{ fill: COLORS.perempuan, r: 5 }}
                                />
                                <Line 
                                    type="monotone" 
                                    dataKey="Total" 
                                    stroke={COLORS.total} 
                                    strokeWidth={2}
                                    strokeDasharray="5 5"
                                    dot={{ fill: COLORS.total, r: 5 }}
                                />
                            </LineChart>
                        </ResponsiveContainer>
                    </CardContent>
                </Card>
            </div>

            {/* Detailed Table */}
            <Card>
                <CardHeader>
                    <CardTitle>Detail Data per Tingkat</CardTitle>
                    <CardDescription>Tabel lengkap distribusi siswa</CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="rounded-lg border-2 border-border overflow-hidden">
                        <table className="w-full">
                            <thead className="bg-muted/50">
                                <tr>
                                    <th className="px-4 py-3 text-left font-semibold">Tingkat</th>
                                    <th className="px-4 py-3 text-right font-semibold">Laki-laki</th>
                                    <th className="px-4 py-3 text-right font-semibold">Perempuan</th>
                                    <th className="px-4 py-3 text-right font-semibold">Total</th>
                                    <th className="px-4 py-3 text-right font-semibold">Rasio (L:P)</th>
                                </tr>
                            </thead>
                            <tbody>
                                {data.map((item) => {
                                    const lakiLaki = Number(item.laki_laki);
                                    const perempuan = Number(item.perempuan);
                                    const total = Number(item.jumlah_siswa);
                                    const ratio = perempuan > 0 ? (lakiLaki / perempuan).toFixed(2) : '∞';
                                    
                                    return (
                                        <tr key={item.tingkat} className="border-t">
                                            <td className="px-4 py-3 font-medium">Kelas {item.tingkat}</td>
                                            <td className="px-4 py-3 text-right text-blue-600 font-semibold">{lakiLaki}</td>
                                            <td className="px-4 py-3 text-right text-pink-600 font-semibold">{perempuan}</td>
                                            <td className="px-4 py-3 text-right font-semibold">{total}</td>
                                            <td className="px-4 py-3 text-right text-muted-foreground">{ratio}</td>
                                        </tr>
                                    );
                                })}
                                <tr className="border-t-2 bg-muted/30 font-semibold">
                                    <td className="px-4 py-3">Total</td>
                                    <td className="px-4 py-3 text-right text-blue-600">{stats.totalLakiLaki}</td>
                                    <td className="px-4 py-3 text-right text-pink-600">{stats.totalPerempuan}</td>
                                    <td className="px-4 py-3 text-right">{stats.totalSiswa}</td>
                                    <td className="px-4 py-3 text-right text-muted-foreground">
                                        {(stats.totalLakiLaki / stats.totalPerempuan).toFixed(2)}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}