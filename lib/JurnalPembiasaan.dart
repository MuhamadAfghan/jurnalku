import 'package:flutter/material.dart';

class JurnalPembiasaanPage extends StatefulWidget {
  const JurnalPembiasaanPage({super.key});

  @override
  State<JurnalPembiasaanPage> createState() => _JurnalPembiasaanPageState();
}

class _JurnalPembiasaanPageState extends State<JurnalPembiasaanPage> {
  // Status untuk setiap tanggal (null = belum diisi, true = sudah diisi, false = tidak diisi)
  Map<int, bool?> dateStatus = {
    3: false, 4: false, 5: false, 6: false, 7: false,
    10: false, 11: false, 12: false, 13: false, 14: false,
    17: false, 18: false, 19: false, 20: false, 21: false,
    25: null, 26: null, 27: null, 28: null,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.home_outlined, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Tester',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'PPLG XII-4',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text(
                'Jurnal Pembiasaan',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'NOVEMBER - 2025',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 20),

              // Button Bulan Sebelumnya
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back, size: 18),
                label: const Text('Bulan\nSebelumnya'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D47A1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Section A: Pembiasaan Harian
              const Text(
                'A. Pembiasaan harian',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              // Legend
              Row(
                children: [
                  _buildLegend(Colors.green, 'Sudah diisi'),
                  const SizedBox(width: 20),
                  _buildLegend(Colors.grey.shade400, 'Belum diisi'),
                  const SizedBox(width: 20),
                  _buildLegend(Colors.red, 'Tidak diisi'),
                ],
              ),
              const SizedBox(height: 20),

              // Calendar Grid
              _buildCalendarGrid(),

              const SizedBox(height: 40),

              // Section B: Pekerjaan yang dilakukan
              const Text(
                'B. Pekerjaan yang dilakukan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              _buildWorkTable(),

              const SizedBox(height: 40),

              // Section C: Materi yang dipelajari
              const Text(
                'C. Materi yang dipelajari',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              _buildMaterialTable(),

              const SizedBox(height: 20),

              // Status Legend
              Row(
                children: [
                  _buildStatusLegend(Colors.green, 'A : Approved'),
                  const SizedBox(width: 16),
                  _buildStatusLegend(Colors.amber, 'P : Pending'),
                  const SizedBox(width: 16),
                  _buildStatusLegend(Colors.red, 'R : Revisi'),
                ],
              ),

              const SizedBox(height: 40),

              // Section D: Poin
              const Text(
                'D. Poin',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              _buildPointTable(),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    final dates = [
      [3, 4, 5, 6, 7],
      [10, 11, 12, 13, 14],
      [17, 18, 19, 20, 21],
      [24, 25, 26, 27, 28],
    ];

    return Column(
      children: dates.map((row) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: row.map((date) {
              return Expanded(
                child: _buildDateCell(date),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDateCell(int date) {
    final status = dateStatus[date];
    Color bgColor;
    Widget? icon;

    if (status == null) {
      bgColor = Colors.grey.shade300;
      icon = null;
    } else if (status) {
      bgColor = Colors.green.shade50;
      icon = const Icon(Icons.check_circle, color: Colors.green, size: 20);
    } else {
      bgColor = Colors.red.shade50;
      icon = const Icon(Icons.cancel, color: Colors.red, size: 20);
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(
            date.toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          if (icon != null) ...[
            const SizedBox(height: 4),
            icon,
          ],
        ],
      ),
    );
  }

  Widget _buildWorkTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Pekerjaan',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Tgl',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Saksi',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Belum ada pekerjaan yang diinput.',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          // Add button
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.add, color: Color(0xFF0D47A1), size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Tambah Pekerjaan',
                    style: TextStyle(
                      color: Color(0xFF0D47A1),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Materi',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Sts',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Tgl',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Belum ada materi yang diinput.',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          // Add button
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.add, color: Color(0xFF0D47A1), size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Tambah Materi',
                    style: TextStyle(
                      color: Color(0xFF0D47A1),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPointTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Kategori Poin',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                ...['M1', 'M2', 'M3', 'M4'].map((month) => Expanded(
                  child: Text(
                    month,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                )),
              ],
            ),
          ),
          // Rows
          _buildPointRow('(5) mengerjakan project/adanya update progress belajar', [0, 0, 0, 0]),
          _buildPointRow('(1 - 5) poin dari pertanyaan atau laporan pengetahuan materi', [0, 0, 0, 0]),
          _buildPointRow('Jumlah poin minggu ini', [0, 0, 0, 0], isTotal: true),
          _buildPointRowSingle('Jumlah poin ceklist pembiasaan', 0),
          _buildPointRowSingle('Jumlah keseluruhan poin', 0),
        ],
      ),
    );
  }

  Widget _buildPointRow(String label, List<int> values, {bool isTotal = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
        color: isTotal ? Colors.blue.shade50 : null,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
                fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          ...values.map((value) => Expanded(
            child: Text(
              value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildPointRowSingle(String label, int value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}