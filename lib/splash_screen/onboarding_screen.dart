import 'package:flutter/material.dart';
import './widgets/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/icons/heart_icon.png",
      "title": "Selamat Datang di Gen Parental Control",
      "subtitle": "Aplikasi kontrol orang tua yang mudah digunakan",
      "description": "Jaga keamanan anak Anda dengan fitur-fitur yang aman dan sederhana."
    },
    {
      "image": "assets/icons/location_icon.png",
      "title": "Lacak Lokasi Anak",
      "subtitle": "Ketahui dimana anak Anda berada",
      "description": "Lihat lokasi anak Anda secara real-time di peta yang mudah dipahami."
    },
    {
      "image": "assets/icons/timer_icon.png",
      "title": "Atur Waktu",
      "subtitle": "Batasi penggunaan aplikasi dan internet",
      "description": "Tentukan kapan anak boleh menggunakan ponsel dan aplikasi tertentu."
    },
    {
      "image": "assets/icons/privacy_icon.png",
      "title": "Jaga Privasi Anak",
      "subtitle": "Data anak Anda aman dan terlindungi",
      "description": "Semua informasi disimpan dengan aman dan hanya Anda yang bisa melihatnya."
    },
    {
      "image": "assets/icons/rocket_icon.png",
      "title": "Siap Memulai?",
      "subtitle": "Mari mulai melindungi anak Anda",
      "description": "Daftar sekarang dan rasakan kemudahan mengawasi anak dengan aman."
    },
  ];

  void nextPage() {
    if (currentPage < onboardingData.length - 1) {
      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Lewati
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                child: const Text("Lewati"),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => currentPage = index),
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  imageAsset: onboardingData[index]['image']!,
                  title: onboardingData[index]['title']!,
                  subtitle: onboardingData[index]['subtitle']!,
                  description: onboardingData[index]['description']!,
                ),
              ),
            ),
            // Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  width: currentPage == index ? 10 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
            // Button Google dan Email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.g_mobiledata),
                          label: const Text("Google"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.email_outlined),
                          label: const Text("Alamat E-mail"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text.rich(
                    TextSpan(
                      text: "Dengan mendaftar, Anda menyetujui ",
                      children: [
                        TextSpan(
                          text: "Persyaratan Layanan dan Kebijakan Privasi",
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // Arahkan ke halaman login
                    },
                    child: const Text(
                      "Sudah punya akun? Masuk",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
