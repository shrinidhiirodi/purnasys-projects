import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';

class TeamDetailsScreen extends StatelessWidget {
  const TeamDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth =
        ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context),
                          ),
                            Image.asset('assets/icons/homepage/icon_epurna_logo.png', height: 40),
                            Image.asset('assets/icons/homepage/icon_help.png', width: 28),
                          ],
                        ),
                        const SizedBox(height: 20),

                        const Text(
                          'Team Name',
                          style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),

                        ...[
                          'Team Name',
                          'Team Leader',
                          'Team Members',
                          'Contact Number',
                          'Mail id',
                        ].map(
                              (label) => Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: label,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.edit, color: Colors.grey),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('SAVE'),
                          ),
                        ),

                        const SizedBox(height: 30),

                        const Center(
                          child: Text(
                            'SIGN OUT',
                            style: TextStyle(fontSize: 12, letterSpacing: 1),
                          ),
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
