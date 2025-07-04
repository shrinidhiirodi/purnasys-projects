import 'package:flutter/material.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/icons/homepage/icon_profile.png', width: 32),
          Expanded(
            child: Center(
              child: Image.asset('assets/icons/homepage/icon_epurna_logo.png', height: 40),
            ),
          ),
          Row(
            children: [
              Image.asset('assets/icons/homepage/icon_cart.png', width: 32),
              const SizedBox(width: 12),
              Image.asset('assets/icons/homepage/icon_qr.png', width: 32),
              const SizedBox(width: 12),
              Image.asset('assets/icons/homepage/icon_help.png', width: 32),
            ],
          ),
        ],
      ),
    );
  }
}