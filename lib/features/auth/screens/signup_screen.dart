import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controller untuk menangkap input pengguna
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Status toggle obscure password
  bool _obscurePassword = true;

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
              // Tombol Kembali & Logo Utama
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman awal
                    },
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF5188B1)),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 35,
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Card Container Form SIGNUP
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFC),
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(color: Colors.black.withOpacity(0.04)),
                ),
                child: Column(
                  children: [
                    // Judul SIGNUP
                    const Text(
                      'SIGNUP',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3B6291),
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 1. Nama Lengkap
                    _buildLabel('Nama Lengkap'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _fullNameController,
                      hintText: 'Vincent',
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 16),

                    // 2. Nomor Hp
                    _buildLabel('Nomor Hp'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _phoneController,
                      hintText: '081230944410',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),

                    // 3. Email
                    _buildLabel('Email'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _emailController,
                      hintText: 'wassalam1@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),

                    // 4. Password
                    _buildLabel('Password'),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: '••••••••',
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            size: 20,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Color(0xFFB39DDB)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Color(0xFF5188B1), width: 1.5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Tombol Sign up
                    SizedBox(
                      width: 180,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Proses Pendaftaran & Navigasi
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5188B1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget untuk Label Teks
  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  // Helper Widget untuk Text Input Biasa
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required TextInputType keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Color(0xFFB39DDB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Color(0xFF5188B1), width: 1.5),
        ),
      ),
    );
  }
}