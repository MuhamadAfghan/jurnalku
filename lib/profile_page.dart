import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jurnalku/dashboard.dart'; // Pastikan import ini ada

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA), // Light grey bg
        fontFamily: 'Roboto', // Or your preferred font
      ),
      home: const StudentProfilePage(),
    );
  }
}

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  // ================= DATA VARIABLES (Ganti data di sini) =================
  final String userName = "Zahran Fairuz Rahman";
  final String userClass = "PPLG XII-4";
  final String userId = "12310119";
  final String userGroup = "Cic 9";
  final String profileImageUrl =
      "https://i.pravatar.cc/300"; // Ganti dengan URL foto asli
  final String bannerImageUrl =
      "https://images.unsplash.com/photo-1541339907198-e08756dedf3f?q=80&w=1000&auto=format&fit=crop"; // Gambar gedung sekolah

  // Links
  final String instagramLink = "https://www.instagram.com/_zahranfr09/";
  final String linkedinLink = "https://www.linkedin.com/in/zahranfairuz/";
  final String portfolioLink =
      "https://zahranfairuz.github.io/portofolio-zahran/";

  // Colors
  final Color primaryBlue = const Color(0xFF003385);
  final Color primaryGreen = const Color(0xFF1B9E46);
  final Color textDark = const Color(0xFF212121);
  final Color textGrey = const Color(0xFF757575);
  // =======================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildProfileInfo(),
            const SizedBox(height: 10),
            _buildTabs(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  // 1. Header Section (Navbar, Banner, Avatar)
  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerLeft,
      children: [
        // Banner Image
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(bannerImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Dark Overlay for navbar readability
        Container(
          height: 180,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            ),
          ),
        ),
        // Custom App Bar (Top Nav)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  // PERUBAHAN DI SINI: Mengubah Icon menjadi IconButton
                  IconButton(
                    icon: const Icon(Icons.home_outlined, color: Colors.white),
                    onPressed: () {
                      // Navigasi ke DashboardPage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardPage(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userClass,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Main Profile Picture (Overlapping)
        Positioned(
          bottom: -40,
          left: 20,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: primaryBlue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 2. Profile Info Section (Name, Share Button)
  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "$userId | $userClass | $userGroup",
                  style: TextStyle(fontSize: 14, color: textGrey),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_outlined, color: Colors.white),
              constraints: const BoxConstraints(minWidth: 45, minHeight: 45),
            ),
          ),
        ],
      ),
    );
  }

  // 3. Tab Bar Section
  Widget _buildTabs() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          _buildTabItem("Overview", isActive: true),
          _buildTabItem("Portfolio"),
          _buildTabItem("Sertifikat"),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, {bool isActive = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? Colors.blue : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? Colors.blue : textGrey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // 4. Main Content Section
  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Portfolio Section
          _buildSectionHeader("Portfolio Terbaru"),
          _buildEmptyState(
            Icons.work_outline,
            "Portfolio akan ditampilkan di sini",
            color: Colors.brown[300]!,
          ),

          const SizedBox(height: 20),

          // Certificate Section
          _buildSectionHeader("Sertifikat Terbaru"),
          _buildEmptyState(
            Icons.emoji_events_outlined,
            "Sertifikat akan ditampilkan di sini",
            color: Colors.amber[600]!,
          ),

          const SizedBox(height: 24),

          // Dokumen Section
          const Text(
            "Dokumen",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          _buildDocumentItem(
            title: "Curriculum Vitae",
            subtitle: "Dokumen CV siswa",
            btnText: "Lihat CV",
            btnIcon: Icons.download_outlined,
            btnColor: primaryBlue,
          ),

          const SizedBox(height: 16),

          _buildDocumentItem(
            title: "Kartu Pelajar",
            subtitle: "Kartu identitas siswa",
            btnText: "Lihat Kartu Pelajar",
            btnIcon: Icons.badge_outlined,
            btnColor: primaryGreen,
            showWarning: true,
          ),

          const SizedBox(height: 24),

          // Social Media Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Media Sosial",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 14, color: Colors.grey),
                label: const Text("Edit", style: TextStyle(color: Colors.grey)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 0,
                  ),
                  minimumSize: const Size(0, 32),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildSocialItem(
            Icons.camera_alt_outlined,
            "Instagram",
            instagramLink,
          ),
          _buildSocialItem(
            Icons.business_center_outlined,
            "Linkedin",
            linkedinLink,
          ),
          _buildSocialItem(
            Icons.language,
            "Portofolio",
            portfolioLink,
            isLink: true,
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 16, color: Colors.grey),
                label: const Text(
                  "Tambah",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 30),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Lihat Semua",
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(IconData icon, String text, {required Color color}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(text, style: TextStyle(color: textGrey, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildDocumentItem({
    required String title,
    required String subtitle,
    required String btnText,
    required IconData btnIcon,
    required Color btnColor,
    bool showWarning = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(subtitle, style: TextStyle(color: textGrey, fontSize: 13)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(btnIcon, size: 18, color: Colors.white),
                label: Text(
                  btnText,
                  style: const TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: btnColor,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.upload_file, color: Colors.white),
                constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
              ),
            ),
          ],
        ),
        if (showWarning) ...[
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline, size: 16, color: Colors.orange[800]),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  "Kartu pelajar dapat dilihat oleh anda dan guru",
                  style: TextStyle(color: Colors.orange[800], fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildSocialItem(
    IconData icon,
    String platformName,
    String link, {
    bool isLink = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: Colors.grey[700]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platformName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  link,
                  style: const TextStyle(color: Colors.blue, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.open_in_new, size: 18, color: Colors.grey[400]),
        ],
      ),
    );
  }
}