import 'package:flutter/material.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Delivery Address'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Address List', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('This is where your address list will appear.'),
          ],
        ),
      ),
    );
  }
}
