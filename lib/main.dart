import 'package:flutter/material.dart';
import 'splash_screen/splash_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(const GennApp());
}

class GennApp extends StatelessWidget {
  const GennApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gen',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
