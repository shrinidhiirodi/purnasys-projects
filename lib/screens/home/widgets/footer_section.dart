import 'package:flutter/material.dart';
import '../../../utils/responsive_helper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxContentWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);
        return Center(
          child: Container(
            width: maxContentWidth,
            color: Colors.black,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text('Follow Us', style: TextStyle(color: Colors.white)),
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
                const Text('FAQ | Terms of use | Privacy Policy',
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10),
                const Text('© 2025 e-Purna. All rights reserved.',
                    style: TextStyle(color: Colors.white54)),
              ],
            ),
          ),
        );
      },
    );
  }
}