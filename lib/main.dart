import 'package:flutter/material.dart';
import 'splash_screen/splash_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(const GenApp());
}

class GenApp extends StatelessWidget {
  const GenApp({super.key});
  
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
