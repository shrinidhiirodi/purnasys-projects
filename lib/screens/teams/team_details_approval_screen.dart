import 'package:flutter/material.dart';
import '../common/widgets/base_screen.dart';

class TeamDetailsApprovalScreen extends StatelessWidget {
  const TeamDetailsApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard(
              title: 'Team Details',
              children:  [
                _field('Select Organization Name'),
                _field('Team Name'),
                _field('Team Leader'),
                _field('Contact Number'),
                _field('Mail id'),
                _noteBox(),
              ],
            ),
            const SizedBox(height: 16),
            _actionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        ...children,
      ]),
    );
  }

  static Widget _field(String hint) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(hint),
    );
  }

  static Widget _noteBox() {
    return const TextField(
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Add notes here',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(16),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _pillButton('REJECT', Colors.red),
        _pillButton('APPROVE', const Color(0xFF2E74B6)),
      ],
    );
  }

  Widget _pillButton(String label, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(label),
    );
  }
}
