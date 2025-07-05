import 'package:flutter/material.dart';
import '../../../utils/responsive_helper.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxContentWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);
        return Center(
          child: Container(
            width: maxContentWidth,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('How It Works',
                    style: TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                _buildCard('icon_register.png', 'Register',
                    'Fill a simple form and register onto the platform.'),
                const SizedBox(height: 20),
                _buildCard('icon_verification.png', 'Verification',
                    'Our team does a background check and approval.'),
                const SizedBox(height: 20),
                _buildCard('icon_inventory.png', 'Inventory Mgmt.',
                    'Manage inventory, warehouses, partners efficiently.'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard(String icon, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2676BB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset('assets/icons/homepage/$icon', height: 50, color: Colors.white),
          const SizedBox(height: 10),
          Text(title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 6),
          Text(desc, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}