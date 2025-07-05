import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Follow Us',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/homepage/icon_facebook.png', height: 24),
              const SizedBox(width: 10),
              Image.asset('assets/icons/homepage/icon_twitter.png', height: 24),
              const SizedBox(width: 10),
              Image.asset('assets/icons/homepage/icon_instagram.png', height: 24),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '© 2025 e-Purna. All rights reserved.',
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}
