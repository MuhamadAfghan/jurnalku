import 'package:flutter/material.dart';
import 'package:jurnalku/catatan_sikap_page.dart';
import 'package:jurnalku/progress.dart';
import 'package:jurnalku/profile_page.dart';
import 'JurnalPembiasaan.dart';
import 'PermintaanSaksi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnalku Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Segoe UI',
        primaryColor: const Color(0xFF104E92),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FA),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Icon(Icons.home_outlined, color: Colors.grey[600], size: 26),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Muhamad Afghan Alzena",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "PPLG XII-4",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=12',
                    ),
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF0D2854), Color(0xFF154c96)],
                            ),
                          ),
                        ),
                        Positioned(
                          top: -50,
                          left: -50,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          right: -20,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const Positioned.fill(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Selamat Datang di Jurnalku",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  "Solusi cerdas untuk memantau perkembangan kompetensi siswa secara efektif",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: const Color(0xFF104E92),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Apa itu Jurnalku?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif, terstruktur, dan real-time. Dengan fitur lengkap, proses pemantauan menjadi lebih mudah dan transparan.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          const InfoCard(
                            icon: Icons.apartment_outlined,
                            title: "Dirancang Khusus",
                            description:
                                "Memenuhi kebutuhan spesifik sekolah kami dengan fokus pada kemajuan siswa.",
                          ),
                          const InfoCard(
                            icon: Icons.school_outlined,
                            title: "Efektif",
                            description:
                                "Memudahkan siswa dan guru melihat perkembangan secara real-time.",
                          ),
                          const InfoCard(
                            icon: Icons.layers_outlined,
                            title: "Terintegrasi",
                            description:
                                "Pengajuan kompetensi siswa, validasi dan laporan perkembangan yang transparan.",
                          ),
                          const SizedBox(height: 32),
                          Text(
                            "MENU APLIKASI",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade100),
                            ),
                            child: Column(
                              children: [
                                MenuTile(
                                  icon: Icons.person_outline,
                                  title: "Profil",
                                  subtitle:
                                      "Lihat dan kelola profilmu di sini.",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const StudentProfilePage(),
                                      ),
                                    );
                                  },
                                ),
                                const Divider(
                                  height: 1,
                                  indent: 70,
                                  color: Color(0xFFF0F0F0),
                                ),
                                const MenuTile(
                                  icon: Icons.work_outline,
                                  title: "Portofolio",
                                  subtitle:
                                      "Lihat dan kelola portofolio kompetensimu di sini.",
                                ),
                                const Divider(
                                  height: 1,
                                  indent: 70,
                                  color: Color(0xFFF0F0F0),
                                ),
                                const MenuTile(
                                  icon: Icons.verified_outlined,
                                  title: "Sertifikat",
                                  subtitle:
                                      "Lihat dan unduh sertifikat kompetensimu di sini.",
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade100),
                            ),
                            child: Column(
                              children: [
                                MenuTile(
                                  icon: Icons.book_outlined,
                                  title: "Jurnal Pembiasaan",
                                  subtitle:
                                      "Catat dan pantau kegiatan pembiasaan harianmu.",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const JurnalPembiasaanPage(),
                                      ),
                                    );
                                  },
                                ),
                                const Divider(
                                  height: 1,
                                  indent: 70,
                                  color: Color(0xFFF0F0F0),
                                ),
                                MenuTile(
                                  icon: Icons.people_outline,
                                  title: "Permintaan Saksi",
                                  subtitle:
                                      "Lihat teman yang mengajukan permintaan saksi.",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PermintaanSaksiPage(),
                                      ),
                                    );
                                  },
                                ),
                                const Divider(
                                  height: 1,
                                  indent: 70,
                                  color: Color(0xFFF0F0F0),
                                ),
                                MenuTile(
                                  icon: Icons.bar_chart_rounded,
                                  title: "Progress",
                                  subtitle:
                                      "Lihat kemajuan kompetensi dan pencapaian belajarmu.",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProgressBelajarPage(),
                                      ),
                                    );
                                  },
                                ),
                                const Divider(
                                  height: 1,
                                  indent: 70,
                                  color: Color(0xFFF0F0F0),
                                ),
                                MenuTile(
                                  icon: Icons.warning_amber_rounded,
                                  title: "Catatan Sikap",
                                  subtitle:
                                      "Lihat catatan sikap dan perilaku dari guru.",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CatatanSikapPage(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            "STATISTIK KOMPETENSI",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const StatCard(
                            label: "Materi Diselesaikan",
                            count: "4",
                            status: "Selesai",
                            statusColor: Color(0xFF4CAF50),
                            icon: Icons.check_circle_outline,
                            bgColorIcon: Color(0xFFE8F5E9),
                          ),
                          const StatCard(
                            label: "Pengajuan Pending",
                            count: "0",
                            status: "Pending",
                            statusColor: Color(0xFFFF9800),
                            icon: Icons.access_time,
                            bgColorIcon: Color(0xFFFFF3E0),
                          ),
                          const StatCard(
                            label: "Materi Hari Ini",
                            count: "0",
                            status: "Hari Ini",
                            statusColor: Color(0xFF2196F3),
                            icon: Icons.calendar_today_outlined,
                            bgColorIcon: Color(0xFFE3F2FD),
                          ),
                          const StatCard(
                            label: "Materi Revisi",
                            count: "0",
                            status: "Revisi",
                            statusColor: Color(0xFF9C27B0),
                            icon: Icons.refresh,
                            bgColorIcon: Color(0xFFF3E5F5),
                          ),
                          const SizedBox(height: 32),
                          const Text(
                            "Progress Akademik",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade100),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLegend(
                                  "Selesai",
                                  "4",
                                  const Color(0xFF3F51B5),
                                ),
                                _buildLegend(
                                  "Pending",
                                  "0",
                                  const Color(0xFF7986CB),
                                ),
                                _buildLegend(
                                  "Belum",
                                  "0",
                                  const Color(0xFFADD8E6),
                                ),
                                _buildLegend(
                                  "Hari Ini",
                                  "0",
                                  const Color(0xFF00BCD4),
                                ),
                                const SizedBox(height: 24),
                                const Row(
                                  children: [
                                    Text(
                                      "Lihat Progress Kamu",
                                      style: TextStyle(
                                        color: Color(0xFF1565C0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_right_alt,
                                      color: Color(0xFF1565C0),
                                      size: 18,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Divider(height: 1, color: Colors.grey[200]),
                                const SizedBox(height: 20),
                                _buildTaskItem("Installasi Postman"),
                                const SizedBox(height: 12),
                                _buildTaskItem(
                                  "Implementasi Penggunaan Postman",
                                ),
                                const SizedBox(height: 24),
                                const Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Lihat semua Kompetensi",
                                        style: TextStyle(
                                          color: Color(0xFF424242),
                                          fontSize: 13,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 14,
                                        color: Color(0xFF424242),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xFFE3F2FD),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Text(
                "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF1565C0),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(String label, String count, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Text(count, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTaskItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            "Approved",
            style: TextStyle(
              color: Color(0xFF4CAF50),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          Icon(icon, size: 48, color: const Color(0xFF104E92)),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const MenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: Color(0xFFE3F2FD),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFF1976D2), size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.blue, size: 18),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String count;
  final String status;
  final Color statusColor;
  final IconData icon;
  final Color bgColorIcon;

  const StatCard({
    super.key,
    required this.label,
    required this.count,
    required this.status,
    required this.statusColor,
    required this.icon,
    required this.bgColorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.grey[700], fontSize: 13),
              ),
              const SizedBox(height: 8),
              Text(
                count,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.circle, size: 8, color: statusColor),
                  const SizedBox(width: 6),
                  Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColorIcon,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: statusColor, size: 24),
          ),
        ],
      ),
    );
  }
}