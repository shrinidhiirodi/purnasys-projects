
import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import 'my_account_details_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxContentWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

          return Column(
            children: [
              Container(
                color: const Color(0xFFF5F5F5),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxContentWidth),
                    child: Row(
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
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color(0xFF2277B5),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxContentWidth),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...['Name', 'User ID', 'E-mail', 'Mobile', 'One Time Password (OTP)', 'Password'].map(
                                    (hint) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: TextField(
                                    obscureText: hint == 'Password',
                                    decoration: InputDecoration(
                                      hintText: hint,
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (_) => const MyAccountDetailsScreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(vertical: 18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text('CREATE ACCOUNT'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
