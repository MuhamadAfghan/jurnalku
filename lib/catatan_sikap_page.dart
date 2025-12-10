import 'package:flutter/material.dart';

class CatatanSikapPage extends StatelessWidget {
  const CatatanSikapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Abu-abu sangat muda modern
      body: SafeArea(
        child: Column(
          children: [
            // --- HEADER CUSTOM (Ukuran disesuaikan mobile) ---
            const _CustomHeader(
              title: "Catatan Sikap",
              userName: "Julian Adi Pratama",
              userClass: "PPLG XII-4",
            ),

            // --- KONTEN ---
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(), // Efek membal ala iOS/Android
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pantau catatan perilaku dan sikap Anda di sini.",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(height: 20),

                    // --- CARD WARNING (KUNING) ---
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFFFB300).withOpacity(0.3)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.info_rounded, color: Color(0xFFFF6F00), size: 28),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Perhatian",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFFF6F00)),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Jika ada catatan yang tidak sesuai, segera hubungi guru jurusan.",
                                  style: TextStyle(color: Colors.orange[900], fontSize: 14, height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // --- STATISTIK (Dibuat lebih besar angkanya) ---
                    Row(
                      children: [
                        _buildStatCard("Total", "0", Colors.blue, Icons.assignment_outlined),
                        const SizedBox(width: 12),
                        _buildStatCard("Perbaikan", "0", Colors.orange, Icons.bolt_rounded),
                        const SizedBox(width: 12),
                        _buildStatCard("Selesai", "0", Colors.green, Icons.check_circle_outline_rounded),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // --- EMPTY STATE (Lebih lega) ---
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            spreadRadius: 2, blurRadius: 15, offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.verified_user_outlined, size: 64, color: Colors.grey[300]),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Tidak Ada Catatan",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Bagus! Belum ada catatan negatif yang dilaporkan.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[500], fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String count, MaterialColor themeColor, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
             BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          children: [
            // Header Kecil
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: themeColor.shade400, size: 14),
                const SizedBox(width: 4),
                Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8),
            // Angka Besar
            Text(count, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: themeColor.shade800)),
          ],
        ),
      ),
    );
  }
}

// --- HEADER REUSABLE ---
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
                // Tombol Home jadi Back Button kalau di mobile
                InkWell(
                  onTap: () => Navigator.of(context).pop(), // Fungsi Back
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
                radius: 22, // Avatar agak lebih besar
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