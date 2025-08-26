import 'package:flutter/material.dart';
import '../common/widgets/base_screen.dart';

class TeamMembersApprovalScreen extends StatelessWidget {
  const TeamMembersApprovalScreen({super.key});

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
                _readonlyField('Organization Name'),
                _readonlyField('Team Name'),
                _readonlyField('Team Leader'),
                _readonlyField('Contact Number'),
                _readonlyField('Mail id'),
              ],
            ),
            const SizedBox(height: 20),
            _buildCard(
              title: 'New members',
              children: [
                _memberTile('Member A'),
                _memberTile('Team Name'),
                _memberTile('Team Name'),
                const SizedBox(height: 12),
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

  static Widget _readonlyField(String hint) {
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

  Widget _memberTile(String name) {
    return Column(
      children: [
        Container(
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(child: Text(name)),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
        const Divider(height: 12, thickness: 0.8, color: Color(0xFFDDDDDD)),
      ],
    );
  }

  Widget _noteBox() {
    return const TextField(
      maxLines: 3,
      decoration: InputDecoration(
        hintText: 'Add notes here',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
