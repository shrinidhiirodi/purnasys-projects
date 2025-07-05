import 'package:flutter/material.dart';
import '../../../utils/responsive_helper.dart';

class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxContentWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);
        return Center(
          child: Container(
            width: maxContentWidth,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Benefits', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                _buildBenefit('icon_easy.png', 'Easy to Use',
                    'Simple UI and easy navigation help members transact easily.'),
                const SizedBox(height: 20),
                _buildBenefit('icon_trust.png', 'Trust',
                    'Restricted entry group approved after due diligence.'),
                const SizedBox(height: 20),
                _buildBenefit('icon_reliable.png', 'Reliable',
                    'Low rates of reputed companies, assured volumes.'),
                const SizedBox(height: 20),
                _buildBenefit('icon_effective.png', 'Effective',
                    'Wider audience reach with e-Purna strategies.'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBenefit(String icon, String title, String desc) {
    return Column(
      children: [
        Image.asset('assets/icons/homepage/$icon', height: 50),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(desc, textAlign: TextAlign.center),
      ],
    );
  }
}