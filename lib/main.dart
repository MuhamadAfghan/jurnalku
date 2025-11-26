import 'package:flutter/material.dart';
import 'package:jurnalku/JurnalPembiasaan.dart';
import 'package:jurnalku/PermintaanSaksi.dart';
import 'loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jurnalku',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PermintaanSaksiPage(),
    );
  }
}