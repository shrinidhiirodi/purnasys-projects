import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top Bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Image.asset(
                              'assets/icons/homepage/icon_epurna_logo.png',
                              height: 40,
                            ),
                            Image.asset(
                              'assets/icons/homepage/icon_help.png',
                              width: 28,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Order Card
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey.shade300,
                              child: const Icon(Icons.image),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                'Order Name',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(),

                        // Options
                        buildOptionTile(
                          context,
                          'Write a product review',
                              () {
                            Navigator.pushNamed(context, '/productFeedback');
                          },
                        ),
                        buildOptionTile(
                          context,
                          'View order details',
                              () {
                            // Implement view order details logic
                          },
                        ),
                        buildOptionTile(
                          context,
                          'Download Invoice',
                              () {
                            // Implement download logic
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildOptionTile(
      BuildContext context, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
