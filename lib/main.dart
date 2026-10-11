import 'package:flutter/material.dart';

void main() {
  runApp(const KartuProfilApp());
}

class KartuProfilApp extends StatelessWidget {
  const KartuProfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Identitas Mahasiswa',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const HalamanProfil(),
    );
  }
}

class HalamanProfil extends StatefulWidget {
  const HalamanProfil({super.key});

  @override
  State<HalamanProfil> createState() => _HalamanProfilState();
}

class _HalamanProfilState extends State<HalamanProfil> {
  bool modeGelap = false;

  @override
  Widget build(BuildContext context) {
    final Color warnaLatar = modeGelap
        ? const Color(0xFF121A16)
        : const Color(0xFFF1F8F2);

    final Color warnaKartu = modeGelap ? const Color(0xFF24332A) : Colors.white;

    final Color warnaTeks = modeGelap ? Colors.white : const Color(0xFF183D28);

    final Color warnaSekunder = modeGelap ? Colors.white70 : Colors.black54;

    final Color warnaHijau = modeGelap
        ? const Color(0xFF81C784)
        : const Color(0xFF2E7D32);

    return Scaffold(
      backgroundColor: warnaLatar,
      appBar: AppBar(
        title: const Text(
          'Kartu Identitas Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2E7D32),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              // Kartu identitas mahasiswa
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 380),
                decoration: BoxDecoration(
                  color: warnaKartu,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(
                    color: warnaHijau.withOpacity(0.5),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    // Bagian atas kartu
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 22,
                        horizontal: 16,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2E7D32),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.school, color: Colors.white, size: 38),
                          SizedBox(height: 8),
                          Text(
                            'KARTU IDENTITAS MAHASISWA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'UNIVERSITAS WARMADEWA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Foto dan data mahasiswa
                    Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: warnaHijau, width: 3),
                            ),
                            child: CircleAvatar(
                              radius: 57,
                              backgroundColor: warnaHijau,
                              child: ClipOval(
                                child: Image.asset(
                                  'images/foto_mahasiswa.jpg',
                                  width: 110,
                                  height: 110,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.person,
                                      size: 70,
                                      color: Colors.white,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          Text(
                            'ELVRIDA KURNIA ORITA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: warnaTeks,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            'Mahasiswa Teknik Komputer',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: warnaSekunder,
                            ),
                          ),

                          const SizedBox(height: 22),

                          Divider(
                            color: warnaHijau.withOpacity(0.3),
                            thickness: 1,
                          ),

                          const SizedBox(height: 12),

                          // Baris informasi NIM
                          _barisInformasi(
                            ikon: Icons.badge_outlined,
                            judul: 'NIM',
                            isi: '202463121022',
                            warnaIkon: warnaHijau,
                            warnaTeks: warnaTeks,
                            warnaSekunder: warnaSekunder,
                          ),

                          const SizedBox(height: 18),

                          // Baris informasi program studi
                          _barisInformasi(
                            ikon: Icons.menu_book,
                            judul: 'Program Studi',
                            isi: 'Teknik Komputer',
                            warnaIkon: warnaHijau,
                            warnaTeks: warnaTeks,
                            warnaSekunder: warnaSekunder,
                          ),

                          const SizedBox(height: 18),

                          // Baris informasi universitas
                          _barisInformasi(
                            ikon: Icons.account_balance,
                            judul: 'Universitas',
                            isi: 'Warmadewa',
                            warnaIkon: warnaHijau,
                            warnaTeks: warnaTeks,
                            warnaSekunder: warnaSekunder,
                          ),

                          const SizedBox(height: 24),

                          // Tombol tema terang dan gelap
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  modeGelap = !modeGelap;
                                });
                              },
                              icon: Icon(
                                modeGelap ? Icons.light_mode : Icons.dark_mode,
                              ),
                              label: Text(
                                modeGelap
                                    ? 'Aktifkan Mode Terang'
                                    : 'Aktifkan Mode Gelap',
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: warnaHijau,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Bagian bawah kartu
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: warnaHijau.withOpacity(0.12),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          bottomRight: Radius.circular(22),
                        ),
                      ),
                      child: Text(
                        'KARTU IDENTITAS MAHASISWA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: warnaTeks,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Universitas Warmadewa • Teknik Komputer',
                textAlign: TextAlign.center,
                style: TextStyle(color: warnaSekunder, fontSize: 12),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan baris informasi
  Widget _barisInformasi({
    required IconData ikon,
    required String judul,
    required String isi,
    required Color warnaIkon,
    required Color warnaTeks,
    required Color warnaSekunder,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: warnaIkon.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(ikon, color: warnaIkon, size: 24),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(judul, style: TextStyle(color: warnaSekunder, fontSize: 12)),
              const SizedBox(height: 4),
              Text(
                isi,
                style: TextStyle(
                  color: warnaTeks,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
