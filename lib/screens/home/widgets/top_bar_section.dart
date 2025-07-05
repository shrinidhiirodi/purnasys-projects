import 'package:flutter/material.dart';
import '../../../utils/responsive_helper.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxContentWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

        return Container(
          color: Colors.transparent, // or your page bg
          child: Center(
            child: Container(
              width: maxContentWidth,
              color: const Color(0xFFF5F5F5),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login-or-create');
                    },
                    child: Image.asset(
                      'assets/icons/homepage/icon_profile.png',
                      width: 28,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/homepage/icon_epurna_logo.png',
                    height: 40,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/icons/homepage/icon_cart.png', width: 28),
                      const SizedBox(width: 12),
                      Image.asset('assets/icons/homepage/icon_qr.png', width: 28),
                      const SizedBox(width: 12),
                      Image.asset('assets/icons/homepage/icon_help.png', width: 28),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
