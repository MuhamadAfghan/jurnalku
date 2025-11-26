import 'package:flutter/material.dart';

class PengaturanAkunPage extends StatelessWidget {
  const PengaturanAkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Background abu modern
      body: SafeArea(
        child: Column(
          children: [
            // --- 1. HEADER CUSTOM ---
            const _CustomHeader(
              title: "Pengaturan Akun",
              userName: "Julian Adi Pratama",
              userClass: "PPLG XII-4",
            ),

            // --- 2. KONTEN FORM (Scrollable) ---
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                children: [
                  
                  // --- SECTION 1: INFORMASI PROFIL ---
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Informasi Profil", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
                        const SizedBox(height: 20),
                        
                        // FOTO PROFIL (CENTER)
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey.shade200, width: 3),
                                ),
                                child: const CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=11"),
                                ),
                              ),
                              // Tombol Edit Kamera Kecil
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0D47A1), // Biru Tua
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                  ),
                                  child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            "Klik foto untuk mengubah",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // FORM READ ONLY (DATA SISWA)
                        _buildReadOnlyField("Nama Lengkap", "Julian Adi Pratama"),
                        _buildReadOnlyField("NIS", "12309691"),
                        _buildReadOnlyField("Rombel", "PPLG XII-4"),
                        _buildReadOnlyField("Rayon", "Cib 3"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // --- SECTION 2: UBAH KATA SANDI ---
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Ubah Kata Sandi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
                        const SizedBox(height: 20),

                        _buildPasswordField("Kata Sandi Lama", "Masukkan password lama"),
                        const SizedBox(height: 16),
                        _buildPasswordField("Kata Sandi Baru", "Masukkan password baru"),
                        
                        const SizedBox(height: 24),
                        
                        // TOMBOL SIMPAN
                        SizedBox(
                          width: double.infinity,
                          height: 50, // Tinggi tombol nyaman di jempol
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0D47A1), // Biru sesuai gambar
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              elevation: 0,
                            ),
                            child: const Text(
                              "Simpan Perubahan",
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                            ),
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
    );
  }

  // --- WIDGET INPUT FIELD (READ ONLY / ABU-ABU) ---
  Widget _buildReadOnlyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey[700])),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6), // Abu-abu background input
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              value,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET INPUT PASSWORD (EDITABLE) ---
  Widget _buildPasswordField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey[700])),
        const SizedBox(height: 8),
        TextField(
          obscureText: true, // Menyembunyikan text jadi bintang/titik
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF0D47A1), width: 1.5),
            ),
            // Icon Mata di kanan
            suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

// --- HEADER REUSABLE (Agar konsisten dengan page lain) ---
class _CustomHeader extends StatelessWidget {
  final String title;
  final String userName;
  final String userClass;

  const _CustomHeader({required this.title, required this.userName, required this.userClass});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
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
                  child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.grey[700], size: 20),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
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
                  Text(userName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1F2937))),
                  const SizedBox(height: 2),
                  Text(userClass, style: TextStyle(fontSize: 11, color: Colors.blueGrey[400])),
                ],
              ),
              const SizedBox(width: 12),
              CircleAvatar(
                radius: 20,
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