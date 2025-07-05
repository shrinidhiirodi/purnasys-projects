import 'package:flutter/material.dart';
import '../../../utils/responsive_helper.dart';

class EnquirySection extends StatelessWidget {
  const EnquirySection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxContentWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);
        return Center(
          child: Container(
            width: maxContentWidth,
            color: Colors.black,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Enquiry', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 16),
                _buildField('Name'),
                const SizedBox(height: 10),
                _buildField('Email Address'),
                const SizedBox(height: 10),
                _buildField('Mobile Number'),
                const SizedBox(height: 10),
                _buildField('What would you like to know ?', maxLines: 4),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Send Enquiry'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}