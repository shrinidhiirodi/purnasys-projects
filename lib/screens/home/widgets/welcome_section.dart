import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        'Welcome to e-Purna! Start your journey to register and list your products or services.',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}