import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';

class MyOrdersListScreen extends StatelessWidget {
  const MyOrdersListScreen({super.key});

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

                        const Text(
                          'My Orders',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Search Bar
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Search orders',
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Order List
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.grey.shade300,
                                    child: const Icon(Icons.shopping_bag),
                                  ),
                                  title: const Text('Order Name',
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                  subtitle: const Text('Shipped'),
                                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/orderDetails');
                                  },
                                ),
                                const Divider(),
                              ],
                            );
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
}
