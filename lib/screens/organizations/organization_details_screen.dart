import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';

class OrganizationDetailsScreen extends StatelessWidget {
  const OrganizationDetailsScreen({super.key});

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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                        'Organization Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),

                      const SizedBox(height: 20),

                      _buildEditableField('Organization Name'),
                      const SizedBox(height: 12),
                      _buildEditableField('GST Number'),
                      const SizedBox(height: 12),
                      _buildEditableField('Pan Number'),
                      const SizedBox(height: 12),
                      _buildEditableField('Address'),
                      const SizedBox(height: 12),
                      _buildEditableField('City'),
                      const SizedBox(height: 12),
                      _buildEditableField('State'),
                      const SizedBox(height: 30),

                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          ),
                          onPressed: () {},
                          child: const Text('SAVE'),
                        ),
                      ),

                      const SizedBox(height: 20),

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
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEditableField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: const Icon(Icons.edit, size: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
