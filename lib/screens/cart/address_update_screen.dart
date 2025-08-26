import 'package:flutter/material.dart';
import '../common/widgets/base_screen.dart';

class AddressUpdateScreen extends StatelessWidget {
  const AddressUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("ADDRESS DETAILS", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _roundedField("Shrinidhi Irodi"),
          _roundedField("114, F2 Havyaka Apartment, Anugraha Layout"),
          _roundedField("Bilekahalli, Bangalore, 560076"),
          _roundedField("9686824694"),
          _roundedField("epurna@gmail.com"),
          _roundedField("12.384947, 14.987634"),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _roundedButton(context, label: "CANCEL", color: Colors.black, onPressed: () {
                Navigator.pop(context);
              }),
              _roundedButton(context, label: "UPDATE", color: Colors.blue, onPressed: () {
                // handle update
              }),
            ],
          ),

        ],
      ),
    );
  }

  Widget _roundedField(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }

  Widget _roundedButton(BuildContext context,
      {required String label, required Color color, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      ),
      onPressed: onPressed,
      child: Text(label.toUpperCase()),
    );
  }
}
