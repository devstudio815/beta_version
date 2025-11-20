"use client"
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { 
    BookOpen, 
    Calendar, 
    FileText, 
    Users, 
    TrendingUp,
    ArrowRight,
    GraduationCap,
    Award,
    BarChart3,
    Clock
} from "lucide-react";
import { motion } from "framer-motion";
import Link from "next/link";

export default function Home() {
    const features = [
        {
            icon: BookOpen,
            title: "Mata Pelajaran",
            description: "Kelola data mata pelajaran dengan mudah",
            color: "from-blue-500 to-cyan-500"
        },
        {
            icon: Calendar,
            title: "Jadwal Pelajaran",
            description: "Atur dan lihat jadwal pembelajaran",
            color: "from-purple-500 to-pink-500"
        },
        {
            icon: FileText,
            title: "Laporan Akademik",
            description: "Monitoring nilai dan prestasi siswa",
            color: "from-green-500 to-emerald-500"
        },
        {
            icon: Users,
            title: "Manajemen Siswa",
            description: "Data lengkap siswa dan kehadiran",
            color: "from-orange-500 to-red-500"
        }
    ];

    const stats = [
        { icon: Users, label: "Total Siswa", value: "1,234", color: "text-blue-600" },
        { icon: BookOpen, label: "Mata Pelajaran", value: "48", color: "text-purple-600" },
        { icon: Award, label: "Prestasi", value: "156", color: "text-green-600" },
        { icon: TrendingUp, label: "Rata-rata Nilai", value: "85.4", color: "text-orange-600" }
    ];

    // Animation variants
    const containerVariants = {
        hidden: { opacity: 0 },
        visible: {
            opacity: 1,
            transition: {
                staggerChildren: 0.1
            }
        }
    };

    const itemVariants = {
        hidden: { y: 20, opacity: 0 },
        visible: {
            y: 0,
            opacity: 1,
            transition: {
                type: "spring" as const,
                stiffness: 100
            }
        }
    } as const;

    const floatingVariants = {
        initial: { y: 0 },
        animate: {
            y: [-10, 10, -10],
            transition: {
                duration: 3,
                repeat: Infinity,
                ease: "easeInOut" as const
            }
        }
    };

    return (
        <main className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-purple-50 overflow-hidden">
            {/* Decorative Elements */}
            <div className="absolute inset-0 overflow-hidden pointer-events-none">
                <motion.div 
                    className="absolute top-20 left-10 w-72 h-72 bg-blue-200 rounded-full mix-blend-multiply filter blur-xl opacity-30"
                    animate={{
                        scale: [1, 1.2, 1],
                        x: [0, 50, 0],
                        y: [0, 30, 0]
                    }}
                    transition={{
                        duration: 8,
                        repeat: Infinity,
                        ease: "easeInOut"
                    }}
                />
                <motion.div 
                    className="absolute top-40 right-20 w-96 h-96 bg-purple-200 rounded-full mix-blend-multiply filter blur-xl opacity-30"
                    animate={{
                        scale: [1, 1.3, 1],
                        x: [0, -50, 0],
                        y: [0, 50, 0]
                    }}
                    transition={{
                        duration: 10,
                        repeat: Infinity,
                        ease: "easeInOut"
                    }}
                />
                <motion.div 
                    className="absolute -bottom-20 left-1/3 w-80 h-80 bg-pink-200 rounded-full mix-blend-multiply filter blur-xl opacity-30"
                    animate={{
                        scale: [1, 1.4, 1],
                        x: [0, 30, 0],
                        y: [0, -40, 0]
                    }}
                    transition={{
                        duration: 12,
                        repeat: Infinity,
                        ease: "easeInOut"
                    }}
                />
            </div>

            <div className="relative z-10 container mx-auto px-6 py-20">
                {/* Hero Section */}
                <motion.div 
                    className="text-center mb-20"
                    initial="hidden"
                    animate="visible"
                    variants={containerVariants}
                >
                    <motion.div 
                        variants={itemVariants}
                        className="mb-6"
                    >
                        <motion.div 
                            className="inline-block p-4 bg-gradient-to-br from-blue-500 to-purple-600 rounded-3xl mb-6 shadow-2xl"
                            whileHover={{ scale: 1.1, rotate: 5 }}
                            transition={{ type: "spring", stiffness: 300 }}
                        >
                            <GraduationCap className="w-16 h-16 text-white" />
                        </motion.div>
                    </motion.div>

                    <motion.h1 
                        variants={itemVariants}
                        className="text-6xl md:text-7xl font-bold mb-6 bg-gradient-to-r from-blue-600 via-purple-600 to-pink-600 bg-clip-text text-transparent"
                    >
                        Sistem Akademik
                    </motion.h1>

                    <motion.p 
                        variants={itemVariants}
                        className="text-xl md:text-2xl text-gray-600 mb-8 max-w-2xl mx-auto"
                    >
                        Platform manajemen sekolah modern untuk monitoring dan analisis data akademik secara real-time
                    </motion.p>

                    <motion.div variants={itemVariants}>
                        <Link href="/dashboard">
                            <motion.div
                                whileHover={{ scale: 1.05 }}
                                whileTap={{ scale: 0.95 }}
                            >
                                <Button 
                                    size="lg" 
                                    className="bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white px-8 py-6 text-lg rounded-full shadow-2xl group"
                                >
                                    Masuk ke Dashboard
                                    <motion.div
                                        animate={{ x: [0, 5, 0] }}
                                        transition={{ duration: 1.5, repeat: Infinity }}
                                    >
                                        <ArrowRight className="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" />
                                    </motion.div>
                                </Button>
                            </motion.div>
                        </Link>
                    </motion.div>
                </motion.div>

                {/* Stats Section */}
                <motion.div 
                    className="grid grid-cols-2 md:grid-cols-4 gap-6 mb-20"
                    initial="hidden"
                    whileInView="visible"
                    viewport={{ once: true }}
                    variants={containerVariants}
                >
                    {stats.map((stat, index) => (
                        <motion.div
                            key={index}
                            variants={itemVariants}
                            whileHover={{ y: -10, scale: 1.05 }}
                        >
                            <Card className="border-2 border-gray-100 shadow-lg hover:shadow-2xl transition-all duration-300">
                                <CardContent className="p-6 text-center">
                                    <stat.icon className={`w-10 h-10 mx-auto mb-3 ${stat.color}`} />
                                    <p className="text-3xl font-bold text-gray-800 mb-1">{stat.value}</p>
                                    <p className="text-sm text-gray-600">{stat.label}</p>
                                </CardContent>
                            </Card>
                        </motion.div>
                    ))}
                </motion.div>

                {/* Features Section */}
                <motion.div
                    initial="hidden"
                    whileInView="visible"
                    viewport={{ once: true }}
                    variants={containerVariants}
                >
                    <motion.h2 
                        variants={itemVariants}
                        className="text-4xl md:text-5xl font-bold text-center mb-12 text-gray-800"
                    >
                        Fitur Unggulan
                    </motion.h2>

                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                        {features.map((feature, index) => (
                            <motion.div
                                key={index}
                                variants={itemVariants}
                                whileHover={{ y: -15, scale: 1.05 }}
                                transition={{ type: "spring", stiffness: 300 }}
                            >
                                <Card className="border-2 border-gray-100 shadow-lg hover:shadow-2xl transition-all duration-300 h-full overflow-hidden group">
                                    <div className={`h-2 bg-gradient-to-r ${feature.color}`} />
                                    <CardContent className="p-6">
                                        <motion.div 
                                            className={`w-14 h-14 rounded-2xl bg-gradient-to-br ${feature.color} flex items-center justify-center mb-4 shadow-lg group-hover:shadow-xl transition-shadow`}
                                            whileHover={{ rotate: 360 }}
                                            transition={{ duration: 0.6 }}
                                        >
                                            <feature.icon className="w-7 h-7 text-white" />
                                        </motion.div>
                                        <h3 className="text-xl font-bold text-gray-800 mb-2">
                                            {feature.title}
                                        </h3>
                                        <p className="text-gray-600 text-sm">
                                            {feature.description}
                                        </p>
                                    </CardContent>
                                </Card>
                            </motion.div>
                        ))}
                    </div>
                </motion.div>

                {/* CTA Section */}
                <motion.div
                    className="mt-20 text-center"
                    initial={{ opacity: 0, scale: 0.8 }}
                    whileInView={{ opacity: 1, scale: 1 }}
                    viewport={{ once: true }}
                    transition={{ duration: 0.5 }}
                >
                    <Card className="border-2 border-blue-200 shadow-2xl bg-gradient-to-br from-blue-50 to-purple-50 overflow-hidden">
                        <CardContent className="p-12">
                            <motion.div
                                variants={floatingVariants}
                                initial="initial"
                                animate="animate"
                            >
                                <BarChart3 className="w-16 h-16 mx-auto mb-6 text-blue-600" />
                            </motion.div>
                            <h3 className="text-3xl font-bold text-gray-800 mb-4">
                                Siap Meningkatkan Efisiensi Akademik?
                            </h3>
                            <p className="text-gray-600 mb-8 max-w-2xl mx-auto">
                                Bergabunglah dengan ribuan sekolah yang sudah menggunakan sistem kami untuk manajemen akademik yang lebih baik
                            </p>
                            <Link href="/dashboard">
                                <motion.div
                                    whileHover={{ scale: 1.05 }}
                                    whileTap={{ scale: 0.95 }}
                                >
                                    <Button 
                                        size="lg"
                                        className="bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white px-10 py-6 text-lg rounded-full shadow-xl"
                                    >
                                        Mulai Sekarang
                                        <Clock className="ml-2 w-5 h-5" />
                                    </Button>
                                </motion.div>
                            </Link>
                        </CardContent>
                    </Card>
                </motion.div>

                {/* Footer */}
                <motion.div
                    className="mt-20 text-center text-gray-600"
                    initial={{ opacity: 0 }}
                    whileInView={{ opacity: 1 }}
                    viewport={{ once: true }}
                    transition={{ delay: 0.5 }}
                >
                    <p className="text-sm">
                        © 2024 Sistem Akademik. Dibuat dengan ❤️ untuk pendidikan Indonesia
                    </p>
                </motion.div>
            </div>
        </main>
    );
}