import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String description;

  const OnboardingContent({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageAsset, height: 120),
          const SizedBox(height: 32),
          Text(title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(subtitle,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(description,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
