import 'package:flutter/material.dart';

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
        fontFamily: 'Segoe UI', // Menggunakan font sistem standar yang bersih
        primaryColor: const Color(0xFF104E92),
        scaffoldBackgroundColor: const Color(
          0xFFF7F9FC,
        ), // Background abu sangat muda
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
            // --- 1. HEADER (FIXED) ---
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
                    ), // Dummy Image
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ),

            // --- 2. SCROLLABLE BODY ---
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // A. HERO SECTION
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 180, // Tinggi disesuaikan
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF0D2854), Color(0xFF154c96)],
                            ),
                          ),
                        ),
                        // Dekorasi Lengkungan (Abstract Shapes)
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
                        // Text Content
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
                          // B. APA ITU JURNALKU CARD
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: const Color(0xFF104E92), // Solid Dark Blue
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

                          // C. INFO CARDS (Vertical)
                          const InfoCard(
                            icon:
                                Icons.apartment_outlined, // Icon gedung sekolah
                            title: "Dirancang Khusus",
                            description:
                                "Memenuhi kebutuhan spesifik sekolah kami dengan fokus pada kemajuan siswa.",
                          ),
                          const InfoCard(
                            icon: Icons
                                .school_outlined, // Icon topi wisuda (mirip)
                            title: "Efektif",
                            description:
                                "Memudahkan siswa dan guru melihat perkembangan secara real-time.",
                          ),
                          const InfoCard(
                            icon: Icons
                                .layers_outlined, // Icon layer (terintegrasi)
                            title: "Terintegrasi",
                            description:
                                "Pengajuan kompetensi siswa, validasi dan laporan perkembangan yang transparan.",
                          ),

                          const SizedBox(height: 32),

                          // D. MENU APLIKASI
                          Text(
                            "MENU APLIKASI",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Group 1
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade100),
                            ),
                            child: const Column(
                              children: [
                                MenuTile(
                                  icon: Icons.person_outline,
                                  title: "Profil",
                                  subtitle:
                                      "Lihat dan kelola profilmu di sini.",
                                ),
                                Divider(
                                  height: 1,
                                  indent: 70,
                                  color: Color(0xFFF0F0F0),
                                ),
                                MenuTile(
                                  icon: Icons.work_outline,
                                  title: "Portofolio",
                                  subtitle:
                                      "Lihat dan kelola portofolio kompetensimu di sini.",
                                ),
                                Divider(
                                  height: 1,
                                  indent: 70,
                                  color: Color(0xFFF0F0F0),
                                ),
                                MenuTile(
                                  icon: Icons.verified_outlined,
                                  title: "Sertifikat",
                                  subtitle:
                                      "Lihat dan unduh sertifikat kompetensimu di sini.",
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Group 2
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade100),
                            ),
                            child: const Column(
                              children: [
                                MenuTile(
                                  icon: Icons.book_outlined,
                                  title: "Jurnal Pembiasaan",
                                  subtitle:
                                      "Catat dan pantau kegiatan pembiasaan harianmu.",
                                ),
                                Divider(
                                  height: 1,
                                  indent: 70,
                                  color: Color(0xFFF0F0F0),
                                ),
                                MenuTile(
                                  icon:
                                      Icons.people_outline, // Permintaan Saksi
                                  title: "Permintaan Saksi",
                                  subtitle:
                                      "Lihat teman yang mengajukan permintaan saksi.",
                                ),
                                Divider(
                                  height: 1,
                                  indent: 70,
                                  color: Color(0xFFF0F0F0),
                                ),
                                MenuTile(
                                  icon:
                                      Icons.bar_chart_rounded, // Progress icon
                                  title: "Progress",
                                  subtitle:
                                      "Lihat kemajuan kompetensi dan pencapaian belajarmu.",
                                ),
                                Divider(
                                  height: 1,
                                  indent: 70,
                                  color: Color(0xFFF0F0F0),
                                ),
                                MenuTile(
                                  icon: Icons
                                      .warning_amber_rounded, // Catatan Sikap
                                  title: "Catatan Sikap",
                                  subtitle:
                                      "Lihat catatan sikap dan perilaku dari guru.",
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 32),

                          // E. STATISTIK KOMPETENSI
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
                            statusColor: Color(0xFF4CAF50), // Green
                            icon: Icons.check_circle_outline,
                            bgColorIcon: Color(0xFFE8F5E9),
                          ),
                          const StatCard(
                            label: "Pengajuan Pending",
                            count: "0",
                            status: "Pending",
                            statusColor: Color(0xFFFF9800), // Orange
                            icon: Icons.access_time,
                            bgColorIcon: Color(0xFFFFF3E0),
                          ),
                          const StatCard(
                            label: "Materi Hari Ini",
                            count: "0",
                            status: "Hari Ini",
                            statusColor: Color(0xFF2196F3), // Blue
                            icon: Icons.calendar_today_outlined,
                            bgColorIcon: Color(0xFFE3F2FD),
                          ),
                          const StatCard(
                            label: "Materi Revisi",
                            count: "0",
                            status: "Revisi",
                            statusColor: Color(0xFF9C27B0), // Purple
                            icon: Icons.refresh,
                            bgColorIcon: Color(0xFFF3E5F5),
                          ),

                          const SizedBox(height: 32),

                          // F. PROGRESS AKADEMIK
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
                                // Legend List
                                _buildLegend(
                                  "Selesai",
                                  "4",
                                  const Color(0xFF3F51B5),
                                ), // Blue/Indigo
                                _buildLegend(
                                  "Pending",
                                  "0",
                                  const Color(0xFF7986CB),
                                ), // Lighter Indigo
                                _buildLegend(
                                  "Belum",
                                  "0",
                                  const Color(0xFFADD8E6),
                                ), // Light Blue
                                _buildLegend(
                                  "Hari Ini",
                                  "0",
                                  const Color(0xFF00BCD4),
                                ), // Cyan

                                const SizedBox(height: 24),

                                // Link Lihat Progress
                                const Row(
                                  children: [
                                    Text(
                                      "Lihat Progress Kamu",
                                      style: TextStyle(
                                        color: Color(0xFF1565C0), // Link Blue
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

                                // Task List Items (Installasi Postman)
                                _buildTaskItem("Installasi Postman"),
                                const SizedBox(height: 12),
                                _buildTaskItem(
                                  "Implementasi Penggunaan Postman",
                                ),

                                const SizedBox(height: 24),

                                // Link Bottom
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

            // --- 3. FOOTER (FIXED BOTTOM STRIP) ---
            Container(
              width: double.infinity,
              color: const Color(0xFFE3F2FD), // Light blue footer bg
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

  // --- Helper Widgets for Progress Section ---
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
            color: const Color(0xFFE8F5E9), // Light Green
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

// --- WIDGET PENDUKUNG ---

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
        // Shadow halus
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

  const MenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              color: Color(0xFFE3F2FD), // Light Blue
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF1976D2), size: 22),
          ),
          const SizedBox(width: 16),
          // Texts
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
          // Arrow
          const Icon(Icons.chevron_right, color: Colors.blue, size: 18),
        ],
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
