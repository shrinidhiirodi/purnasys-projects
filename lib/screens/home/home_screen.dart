import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import 'widgets/benefits_section.dart';
import 'widgets/how_it_works_section.dart';
import 'widgets/enquiry_section.dart';
import 'widgets/footer_section.dart';
import '../common/widgets/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showBackButton: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxContentWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

          return SingleChildScrollView(
            child: Column(
              children: [
                // ✅ Hero Section (white background)
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxContentWidth),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Image.asset(
                          'assets/icons/homepage/icon_welcome.png',
                          height: 220,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Welcome to e-Purna!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2277B5),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Start your journey to register and list your products or services.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),

                // ✅ Other sections
                const BenefitsSection(),
                const HowItWorksSection(),
                const EnquirySection(),
                const FooterSection(),
              ],
            ),
          );
        },
      ),
    );
  }
}
