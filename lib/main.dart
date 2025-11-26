import 'package:flutter/material.dart';
// Pastikan kedua file ini ada di folder lib
import 'panduan_page.dart';
import 'catatan_sikap_page.dart';
import 'pengaturan_akun_page.dart';
import 'package:jurnalku/JurnalPembiasaan.dart';
import 'package:jurnalku/PermintaanSanksi.dart';
import 'loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Jurnalku',
      debugShowCheckedModeBanner: false,
      debugShowCheckedModeBanner: false,
      title: 'Jurnalku',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: const PengaturanAkunPage(),
      home: const JurnalPembiasaanPage(),
    );
  }
}
