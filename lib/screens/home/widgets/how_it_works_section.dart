import 'package:flutter/material.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('How It Works', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Register your account easily.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.list),
              title: Text('List your products or services.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.check),
              title: Text('Get verified and start selling!'),
            ),
          ),
        ],
      ),
    );
  }
}