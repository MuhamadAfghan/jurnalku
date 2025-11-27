import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
        child: Column(
          children: [
            // HEADER IMAGE
            Image.asset(
              'assets/images/Banner-Web.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 32),

            // FORM LOGIN
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(text: "Masuk untuk memulai "),
                        TextSpan(
                          text: "Jurnalku",
                          style: TextStyle(color: Color(0xFF0D47A1)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  const Text(
                    "Username atau NIS",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukkan username atau NIS",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF0D47A1)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Masukkan password",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF0D47A1)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0D47A1),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Center(
                    child: Text(
                      "Lupa password? Hubungi guru laboran.",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            // SECTION TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Menyatukan Upaya untuk Kemajuan Siswa",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40),

            // CARD FITUR
            ..._featureCards(),

            const SizedBox(height: 60),

            // FOOTER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              color: const Color(0xFF0D47A1),
              child: Column(
                children: [
                  // Social Media Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon(
                        FontAwesomeIcons.whatsapp,
                        'https://wa.me/6282260168080', // Ganti dengan nomor WhatsApp
                      ),
                      const SizedBox(width: 20),
                      _socialIcon(
                        FontAwesomeIcons.instagram,
                        'https://www.instagram.com/smkwikramabogor',
                      ),
                      const SizedBox(width: 20),
                      _socialIcon(
                        FontAwesomeIcons.linkedin,
                        'https://www.linkedin.com/school/smkwikramabogor',
                      ),
                      const SizedBox(width: 20),
                      _socialIcon(
                        FontAwesomeIcons.youtube,
                        'https://www.youtube.com/@smkwikramabogor',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // Floating Button - Jelajahi siswa
      Positioned(
        right: 20,
        bottom: 20,
        child: FloatingActionButton.extended(
          onPressed: () {
            // Aksi untuk jelajahi siswa
          },
          backgroundColor: const Color(0xFF0D47A1),
          icon: const Icon(Icons.explore, color: Colors.white),
          label: const Text(
            'Jelajahi siswa',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ],
      ),
    );
  }

  // Social Media Icon Widget with URL
  Widget _socialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: FaIcon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  // Method to launch URL
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  // LIST FITUR
  List<Widget> _featureCards() {
    return [
      _feature(
        icon: Icons.school,
        title: "Dirancang untuk Sekolah Kami",
        desc:
            "Dikembangkan khusus untuk memenuhi kebutuhan sekolah kami dengan fokus pada kemajuan siswa kami.",
        color: const Color(0xFFFFF3E0),
        iconColor: const Color(0xFFFF9800),
      ),
      _feature(
        icon: Icons.hub_outlined,
        title: "Pemantauan yang Terstruktur",
        desc:
            "Memudahkan guru dalam menyusun dan memantau daftar kompetensi keahlian yang harus dikuasai siswa.",
        color: const Color(0xFFF3E5F5),
        iconColor: const Color(0xFF9C27B0),
      ),
      _feature(
        icon: Icons.insights_outlined,
        title: "Fitur Praktis dan Bermanfaat",
        desc:
            "Termasuk reminder otomatis, grafik perkembangan, dan analisis mendalam untuk efektivitas belajar.",
        color: const Color(0xFFE3F2FD),
        iconColor: const Color(0xFF2196F3),
      ),
      _feature(
        icon: Icons.how_to_reg_outlined,
        title: "Pengajuan Kompetensi oleh Siswa",
        desc:
            "Siswa dapat mengajukan kompetensi yang telah dikuasai untuk diverifikasi oleh guru.",
        color: const Color(0xFFFFE0B2),
        iconColor: const Color(0xFFFF9800),
      ),
      _feature(
        icon: Icons.verified_outlined,
        title: "Validasi dan Tanda Tangan Guru",
        desc:
            "Kompetensi yang disetujui diberikan tanda terima dan tanda tangan guru sebagai bukti.",
        color: const Color(0xFFE8F5E9),
        iconColor: const Color(0xFF4CAF50),
      ),
      _feature(
        icon: Icons.monitor_heart_outlined,
        title: "Pantauan Real-Time dan Transparan",
        desc:
            "Monitoring langsung, menciptakan lingkungan belajar yang efisien.",
        color: const Color(0xFFFCE4EC),
        iconColor: const Color(0xFFE91E63),
      ),
    ];
  }

  Widget _feature({
    required IconData icon,
    required String title,
    required String desc,
    required Color color,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 28, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}