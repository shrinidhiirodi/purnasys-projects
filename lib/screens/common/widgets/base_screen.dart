import 'package:flutter/material.dart';
import '../../../utils/responsive_helper.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final bool showBackButton;

  const BaseScreen({
    super.key,
    required this.child,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ❌ Removed mainAxisSize: MainAxisSize.min
                  children: [
                    // ✅ Top Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left side: Back or Profile + Logo
                          Row(
                            children: [
                              if (showBackButton)
                                IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  onPressed: () => Navigator.pop(context),
                                )
                              else
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Image.asset(
                                    'assets/icons/homepage/icon_profile.png',
                                    height: 28,
                                  ),
                                  onPressed: () {
                                    // Ensure it's safe to call during build
                                    Future.microtask(() {
                                      Navigator.pushNamed(context, '/login');
                                    });
                                  },
                                ),
                              const SizedBox(width: 8),
                              Image.asset(
                                'assets/icons/homepage/icon_epurna_logo.png',
                                height: 40,
                              ),
                            ],
                          ),

                          // Right side icons
                          Row(
                            children: [
                              Image.asset('assets/icons/homepage/icon_cart.png', height: 24),
                              const SizedBox(width: 16),
                              Image.asset('assets/icons/homepage/icon_qr.png', height: 24),
                              const SizedBox(width: 16),
                              Image.asset('assets/icons/homepage/icon_help.png', height: 24),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // ✅ Scrollable body
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: child,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
