import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. Logo di bagian atas
                Image.asset(
                  'assets/images/logo.png',
                  width: 220,
                  fit: BoxFit.contain,
                ),
                
                const SizedBox(height: 25),

                // 2. Gambar Ilustrasi Bus
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/people-running-bus-background-with-bus-stop-hurry-symbols-isometric-illustration_1284-62222 1.png', // Sesuaikan nama file gambar ilustrasimu
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 25),

                // 3. Judul "Selamat Datang!"
                const Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 10),

                // 4. Deskripsi singkat
                const Text(
                  'Goeing adalah aplikasi layanan Booking tiket bus secara Online. Masuk atau daftar agar dapat mendapatkan layanan.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),

                const Spacer(),

                // 5. Tombol MASUK dan DAFTAR berdampingan
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tombol MASUK
                    SizedBox(
                      width: 130,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5188B1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'MASUK',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 20),

                    // Tombol DAFTAR
                    SizedBox(
                      width: 130,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5188B1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'DAFTAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}