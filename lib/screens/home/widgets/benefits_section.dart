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
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Benefits',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildBenefitItem(
                    iconPath: 'assets/icons/homepage/icon_easy.png',
                    title: 'Easy to Use',
                    description:
                    'With its simple UI and easy navigations, members can easily do the transactions on the platform.',
                  ),
                  const SizedBox(height: 20),
                  _buildBenefitItem(
                    iconPath: 'assets/icons/homepage/icon_trust.png',
                    title: 'Trust',
                    description:
                    'E-purna is a restricted entry group of mutually networked members that are approved after due Diligence.',
                  ),
                  const SizedBox(height: 20),
                  _buildBenefitItem(
                    iconPath: 'assets/icons/homepage/icon_reliable.png',
                    title: 'Reliable',
                    description:
                    'Low rates of the reputed companies are already negotiated based on high and assured volumes.',
                  ),
                  const SizedBox(height: 20),
                  _buildBenefitItem(
                    iconPath: 'assets/icons/homepage/icon_effective.png',
                    title: 'Effective',
                    description:
                    'You can reach a wider audience quickly with e-Purna Go to Market strategies.',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBenefitItem({
    required String iconPath,
    required String title,
    required String description,
  }) {
    return Column(
      children: [
        Image.asset(
          iconPath,
          height: 50,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
