import 'package:flutter/material.dart';

class EnquirySection extends StatelessWidget {
  const EnquirySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enquiry Form', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: 'Your Name', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: 'Your Email', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: 'Message', border: OutlineInputBorder()),
            maxLines: 4,
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: const Text('Submit')),
        ],
      ),
    );
  }
}