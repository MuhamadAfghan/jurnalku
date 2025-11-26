import 'package:flutter/material.dart';

class PanduanPage extends StatelessWidget {
  const PanduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // --- HEADER ---
            const _CustomHeader(
              title: "Panduan",
              userName: "Julian Adi Pratama",
              userClass: "PPLG XII-4",
            ),

            // --- KONTEN ---
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                children: [
                   // Banner Info
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.blue.withOpacity(0.1)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.library_books_outlined, color: Color(0xFF0D47A1), size: 28),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Pusat Bantuan",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0D47A1)),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Temukan panduan lengkap penggunaan aplikasi di sini.",
                                style: TextStyle(color: Colors.grey[800], fontSize: 14, height: 1.4),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  _buildSectionTitle("AKUN & UMUM"),
                  _buatItem(Icons.account_circle_rounded, "Unggah Profile", "Update foto & biodata"),
                  _buatItem(Icons.lock_outline_rounded, "Ganti Password", "Keamanan akun"),

                  const SizedBox(height: 30),
                  _buildSectionTitle("AKTIVITAS SISWA"),
                  _buatItem(Icons.edit_document, "Mengisi Jurnal", "Laporan harian"),
                  _buatItem(Icons.person_pin_rounded, "Kelengkapan Profile", "Cek data diri"),
                  _buatItem(Icons.collections_bookmark_rounded, "Portfolio", "Upload karya"),
                  _buatItem(Icons.stars_rounded, "Sertifikat", "Prestasi"),
                  _buatItem(Icons.feedback_rounded, "Catatan Sikap", "Laporan guru"),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 4),
      child: Text(
        title, 
        style: TextStyle(
          fontSize: 13, 
          fontWeight: FontWeight.bold, 
          color: Colors.grey[500], 
          letterSpacing: 1.5
        )
      ),
    );
  }

  Widget _buatItem(IconData icon, String judul, String subjudul) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16), // Jarak antar kartu lebih lega
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Lebih bulat
        boxShadow: [
           BoxShadow(color: Colors.grey.withOpacity(0.04), spreadRadius: 4, blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Padding dalam lebih lega
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: const Color(0xFFE3F2FD), borderRadius: BorderRadius.circular(14)),
                  child: Icon(icon, color: const Color(0xFF1565C0), size: 26), // Icon lebih besar
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)),
                      const SizedBox(height: 6),
                      Text(subjudul, style: TextStyle(fontSize: 14, color: Colors.grey[500]), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: Colors.grey[300], size: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- HEADER REUSABLE (Sama dengan yang atas) ---
class _CustomHeader extends StatelessWidget {
  final String title;
  final String userName;
  final String userClass;

  const _CustomHeader({required this.title, required this.userName, required this.userClass});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.grey[700], size: 22),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(userName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1F2937))),
                  const SizedBox(height: 2),
                  Text(userClass, style: TextStyle(fontSize: 12, color: Colors.blueGrey[400])),
                ],
              ),
              const SizedBox(width: 12),
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.blue.shade100,
                backgroundImage: const NetworkImage("https://i.pravatar.cc/150?img=11"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}