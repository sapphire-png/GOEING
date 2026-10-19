import 'package:flutter/material.dart';
import '../../auth/screens/welcome_screen.dart';

class SnkScreen extends StatefulWidget {
  const SnkScreen({super.key});

  @override
  State<SnkScreen> createState() => _SnkScreenState();
}

class _SnkScreenState extends State<SnkScreen> {
  // Variable untuk menyimpan status checkbox
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA), // Background sedikit keabuan bersih
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo Utama
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              // 1. Ketentuan Pemesanan
              _buildSnkCard(
                icon: Icons.access_time_filled_rounded,
                badgeText: 'Wajib',
                badgeColor: const Color(0xFFE8F0FE),
                badgeTextColor: const Color(0xFF3B6291),
                title: '1. Ketentuan Pemesanan & Boarding',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.4),
                        children: [
                          TextSpan(text: 'Kehadiran di pool atau terminal keberangkatan minimal '),
                          TextSpan(
                            text: '30 menit sebelum jadwal armada',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '. Verifikasi kartu identitas fisik (KTP/SIM/Paspor) wajib sesuai dengan data penumpang pada e-tiket resmi.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF4F9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.info_outline, size: 16, color: Color(0xFF5188B1)),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Toleransi batas keterlambatan keberangkatan maks. 10 menit sebelum pintu bus ditutup.',
                              style: TextStyle(fontSize: 11, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 2. Kebijakan Bagasi
              _buildSnkCard(
                icon: Icons.card_travel_rounded,
                badgeText: 'Maks 20 Kg',
                badgeColor: const Color(0xFFE8F0FE),
                badgeTextColor: const Color(0xFF3B6291),
                title: '2. Kebijakan Bagasi Penumpang',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.4),
                        children: [
                          TextSpan(text: 'Setiap tiket mencakup bagasi cuma-cuma hingga '),
                          TextSpan(
                            text: 'maksimal 20 kg',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' di kompartemen bagasi bawah dan 1 tas kabin kecil (maks. 5 kg) di rak atas kursi.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        _buildWarningTag('Tanpa Senjata/Bahan Peledak'),
                        _buildWarningTag('Tanpa Hewan Peliharaan'),
                      ],
                    ),
                  ],
                ),
              ),

              // 3. Perubahan Jadwal
              _buildSnkCard(
                icon: Icons.calendar_month_rounded,
                badgeText: 'H-1 Keberangkatan',
                badgeColor: const Color(0xFFE8F0FE),
                badgeTextColor: const Color(0xFF3B6291),
                title: '3. Perubahan Jadwal (Reschedule)',
                content: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.4),
                    children: [
                      TextSpan(text: 'Prosedur pemindahan jadwal resmi dapat diajukan mandiri di aplikasi selambat-lambatnya '),
                      TextSpan(
                        text: '24 jam (H-1)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' sebelum jadwal armada asal. Perubahan tunduk pada ketersediaan bangku dan penyesuaian selisih tarif tiket baru.'),
                    ],
                  ),
                ),
              ),

              // 4. Kebijakan Refund
              _buildSnkCard(
                icon: Icons.published_with_changes_rounded,
                badgeText: 's.d 80% Kembali',
                badgeColor: const Color(0xFFFDE8E8),
                badgeTextColor: const Color(0xFFD9534F),
                title: '4. Kebijakan Refund & Pembatalan',
                content: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.4),
                    children: [
                      TextSpan(text: 'Tiket yang dibatalkan sesuai regulasi berhak memperoleh pengembalian dana hingga '),
                      TextSpan(
                        text: 'maksimal 80%',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' dari harga pokok tiket, diproses otomatis via transfer bank atau saldo e-wallet dalam 3-7 hari kerja.'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Card Checkbox Persetujuan
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      activeColor: const Color(0xFF5188B1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Saya telah membaca, memahami, dan menyetujui seluruh Syarat & Ketentuan serta Kebijakan Privasi GOEING.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Data pribadi Anda dilindungi dengan enkripsi transit tingkat perbankan.',
                            style: TextStyle(fontSize: 11, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Tombol "Setuju & Lanjutkan" (Aktif hanya jika _isChecked = true)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _isChecked
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomeScreen(),
                            ),
                          );
                        }
                      : null, // Jika belum dicentang, nilainya null (tombol mati/disabled)
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5188B1),
                    disabledBackgroundColor: Colors.grey.shade300, // Warna saat belum dicentang
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Setuju & Lanjutkan ke Aplikasi',
                        style: TextStyle(
                          color: _isChecked ? Colors.white : Colors.grey.shade600,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                        color: _isChecked ? Colors.white : Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget untuk membuat Card Item SnK
  Widget _buildSnkCard({
    required IconData icon,
    required String badgeText,
    required Color badgeColor,
    required Color badgeTextColor,
    required String title,
    required Widget content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 22, color: const Color(0xFF5188B1)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: badgeTextColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          content,
        ],
      ),
    );
  }

  // Helper Widget untuk Tag Peringatan Merah
  Widget _buildWarningTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFDE8E8),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.block, size: 12, color: Color(0xFFD9534F)),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(fontSize: 10, color: Color(0xFFD9534F), fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}