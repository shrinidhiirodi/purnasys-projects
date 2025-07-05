import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import 'widgets/top_bar_section.dart';
import 'widgets/welcome_section.dart';
import 'widgets/benefits_section.dart';
import 'widgets/how_it_works_section.dart';
import 'widgets/enquiry_section.dart';
import 'widgets/footer_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxContentWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxContentWidth),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    TopBarSection(),
                    WelcomeSection(),
                    BenefitsSection(),
                    HowItWorksSection(),
                    EnquirySection(),
                    FooterSection(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
