import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';

class CreateTeamScreen extends StatelessWidget {
  const CreateTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double responsiveWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: responsiveWidth),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  ),
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
                        'Create Your Team',
                        style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),

                      // Form fields
                      ...[
                        'Team Name',
                        'Team Leader',
                        'Team Members',
                        'Contact Number',
                        'Email ID',
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
                          onPressed: () {
                            // Handle save
                          },
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
            );
          },
        ),
      ),
    );
  }
}
