import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Belajar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ProgressBelajarPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProgressBelajarPage extends StatelessWidget {
  const ProgressBelajarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.home_outlined, color: Color(0xFF6B7280)),
          onPressed: () {},
        ),
        title: const Row(
          children: [
            Icon(Icons.chevron_right, color: Color(0xFF6B7280), size: 16),
            SizedBox(width: 4),
            Text(
              'Progress',
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'M. Afgan Alzena',
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'PPLG XII-4',
                  style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFF374151),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header responsive
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Progress Belajar',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF111827),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Pantau perkembangan kompetensi dan materi pembelajaran Anda',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDBEAFE),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Tuesday, 11 November 2025',
                          style: TextStyle(
                            color: Color(0xFF1D4ED8),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Progress Belajar',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Pantau perkembangan kompetensi dan materi pembelajaran Anda',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDBEAFE),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Tuesday, 11 November 2025',
                          style: TextStyle(
                            color: Color(0xFF1D4ED8),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),

            const SizedBox(height: 24),

            // Stats Cards responsive
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          title: 'Total Pengajuan',
                          value: '1',
                          subtitle: 'Semua status',
                          color: Colors.blue,
                          icon: Icons.check_circle_outline,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatCard(
                          title: 'Halaman Ini',
                          value: '0',
                          subtitle: 'Data ditampilkan',
                          color: Colors.green,
                          icon: Icons.description_outlined,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatCard(
                          title: 'Status Pending',
                          value: '0',
                          subtitle: 'Perlu validasi',
                          color: Colors.orange,
                          icon: Icons.access_time,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatCard(
                          title: 'Total Halaman',
                          value: '1',
                          subtitle: 'Navigasi tersedia',
                          color: Colors.purple,
                          icon: Icons.public,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _StatCard(
                              title: 'Total Pengajuan',
                              value: '1',
                              subtitle: 'Semua status',
                              color: Colors.blue,
                              icon: Icons.check_circle_outline,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _StatCard(
                              title: 'Halaman Ini',
                              value: '0',
                              subtitle: 'Data ditampilkan',
                              color: Colors.green,
                              icon: Icons.description_outlined,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _StatCard(
                              title: 'Status Pending',
                              value: '0',
                              subtitle: 'Perlu validasi',
                              color: Colors.orange,
                              icon: Icons.access_time,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _StatCard(
                              title: 'Total Halaman',
                              value: '1',
                              subtitle: 'Navigasi tersedia',
                              color: Colors.purple,
                              icon: Icons.public,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),

            const SizedBox(height: 24),

            // Sections
            _SectionCard(
              title: 'Project Work',
              subtitle: 'Kompetensi dan materi pembelajaran',
              headers: const [
                'KOMPETENSI',
                'GURU',
                'TANGGAL',
                'STATUS',
                'CATATAN GURU',
                'CATATAN SISWA',
              ],
              data: const [],
            ),

            const SizedBox(height: 16),

            _SectionCard(
              title: 'Mobile Apps',
              subtitle: 'Kompetensi dan materi pembelajaran',
              headers: const [
                'KOMPETENSI',
                'GURU',
                'TANGGAL',
                'STATUS',
                'CATATAN GURU',
                'CATATAN SISWA',
              ],
              data: const [
                [
                  'Flutter : Slicing',
                  'M. Alfin Mulya Putra',
                  '28 Okt 2025',
                  'Approved',
                  'Tidak ada catatan',
                  'Tidak ada catatan',
                ],
              ],
            ),

            const SizedBox(height: 16),

            _SectionCard(
              title: 'UKK (Uji Kompetensi Keahlian)',
              subtitle: 'Kompetensi dan materi pembelajaran',
              headers: const [
                'KOMPETENSI',
                'GURU',
                'TANGGAL',
                'STATUS',
                'CATATAN GURU',
                'CATATAN SISWA',
              ],
              data: const [],
            ),

            const SizedBox(height: 16),

            _SectionCard(
              title: 'GIM',
              subtitle: 'Kompetensi dan materi pembelajaran',
              headers: const [
                'KOMPETENSI',
                'GURU',
                'TANGGAL',
                'STATUS',
                'CATATAN GURU',
                'CATATAN SISWA',
              ],
              data: const [],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color color;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> headers;
  final List<List<String>> data;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.headers,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),

          // Horizontal scrollable table
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width - 32,
              ),
              child: Column(
                children: [
                  // Table Header
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF9FAFB),
                      border: Border(
                        top: BorderSide(color: Color(0xFFE5E7EB)),
                        bottom: BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                    ),
                    child: Row(
                      children: headers
                          .map(
                            (header) => SizedBox(
                              width: 120,
                              child: Text(
                                header,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF374151),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  // Table Data
                  if (data.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(32),
                      child: Center(
                        child: Text(
                          'Tidak ada data',
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  else
                    ...data
                        .map(
                          (row) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Color(0xFFE5E7EB)),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    row[0],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF111827),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDBEAFE),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      row[1],
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF1D4ED8),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        size: 12,
                                        color: Color(0xFF6B7280),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        row[2],
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF1D4ED8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDCFCE7),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 4,
                                          height: 4,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF16A34A),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          row[3],
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFF16A34A),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    row[4],
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF6B7280),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    row[5],
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF6B7280),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
