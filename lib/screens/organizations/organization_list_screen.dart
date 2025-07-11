import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';

class OrganizationListScreen extends StatelessWidget {
  const OrganizationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

          return SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Row(
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
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Organization',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Search Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Organization List
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: const Text('Organization Name'),
                                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                                onTap: () {
                                  Navigator.pushNamed(context, '/organizationDetails');
                                },
                              ),
                              const Divider(height: 1),
                            ],
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Sign Out
                    const Center(
                      child: Text(
                        'SIGN OUT',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
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
