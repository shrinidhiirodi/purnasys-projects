import 'package:flutter/material.dart';
import '../../../utils/responsive_helper.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // <-- Wrap in SafeArea
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxContentWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

          return Container(
            color: Colors.transparent,
            child: Center(
              child: Container(
                width: maxContentWidth,
                color: const Color(0xFFF5F5F5),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // LEFT ICON
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Image.asset('assets/icons/homepage/icon_profile.png', height: 28),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),

                    // CENTER LOGO
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/icons/homepage/icon_epurna_logo.png',
                          height: 40,
                        ),
                      ),
                    ),

                    // RIGHT ICONS
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Image.asset('assets/icons/homepage/icon_cart.png', height: 24),
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart-details');
                          },
                        ),
                        const SizedBox(width: 12),
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Image.asset('assets/icons/homepage/icon_qr.png', height: 24),
                          onPressed: () {
                            Navigator.pushNamed(context, '/products');
                          },
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {
                            // TODO: Help icon logic
                          },
                          child: Image.asset(
                            'assets/icons/homepage/icon_help.png',
                            height: 28,
                          ),
                        ),
                      ],
                    ),
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
