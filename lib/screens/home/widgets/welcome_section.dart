import 'package:flutter/material.dart';
import '../../../utils/responsive_helper.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxContentWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/homepage/welcome_illustration.png'),
                const SizedBox(height: 12),
                const Text(
                  'Welcome to e-Purna!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF2676BB),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Start your journey to register and list your products or services.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
