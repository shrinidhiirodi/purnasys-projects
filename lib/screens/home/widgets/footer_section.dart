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
          Text('Follow Us', style: TextStyle(color: Colors.white)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook, color: Colors.white),
              const SizedBox(width: 10),
              Icon(Icons.twitter, color: Colors.white),
              const SizedBox(width: 10),
              Icon(Icons.instagram, color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
          Text('© 2025 e-Purna. All rights reserved.', style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}