import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Index untuk Bottom Navigation Bar (0: Search/Home, 1: History, 2: Account)
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo Utama (Posisi di Tengah)
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 15),

              // Sapaan Pengguna
              const Text(
                'Halo, Vincent.\nSedang mencari bis?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 15),

              // Ilustrasi Halte Bus
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/istockphoto-1268299100-612x612_1-removebg-preview 1.png',
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),

              // Card Container Form Pencarian Bus
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFC),
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(color: Colors.black.withOpacity(0.04)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Dari
                    _buildSearchRow(
                      icon: Icons.location_on,
                      iconColor: Colors.black,
                      label: 'Dari',
                      value: 'Arjosari',
                    ),
                    const Divider(height: 20, thickness: 0.5),

                    // Ke
                    _buildSearchRow(
                      icon: Icons.adjust,
                      iconColor: Colors.black,
                      label: 'Ke',
                      value: 'Atlantis',
                    ),
                    const Divider(height: 20, thickness: 0.5),

                    // Penumpang
                    _buildSearchRow(
                      icon: Icons.group_outlined,
                      iconColor: Colors.black54,
                      label: 'Penumpang',
                      value: '2 orang',
                    ),
                    const Divider(height: 20, thickness: 0.5),

                    // Tanggal & Pukul (Berjajar)
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined, size: 18, color: Colors.black54),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Tanggal', style: TextStyle(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 2),
                                  Text('2022/1/1', style: TextStyle(fontSize: 13, color: Colors.black87)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(height: 30, width: 1, color: Colors.grey.shade300),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.access_time_rounded, size: 18, color: Colors.black54),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Pukul', style: TextStyle(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 2),
                                  Text('6.30', style: TextStyle(fontSize: 13, color: Colors.black87)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Cari
              Center(
                child: SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Navigasi ke halaman hasil pencarian bus (Search Result)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5188B1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Cari',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation Bar sesuai desain
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: const Color(0xFF3B6291),
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          elevation: 0,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            // TODO: Tambahkan navigasi antar tab utama (Home, History, Account)
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 28),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined, size: 28),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded, size: 28),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget untuk Baris Form Pencarian
  Widget _buildSearchRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }
}