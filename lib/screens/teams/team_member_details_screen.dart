import 'package:flutter/material.dart';
import '../common/widgets/base_screen.dart'; // Keep this as your base layout
import '../../models/team_member.dart';

class TeamMemberDetailsScreen extends StatefulWidget {

  final TeamMember? initial;

  const TeamMemberDetailsScreen({super.key, this.initial}); // <-- accept initial


  @override
  State<TeamMemberDetailsScreen> createState() => _TeamMemberDetailsScreenState();
}

class _TeamMemberDetailsScreenState extends State<TeamMemberDetailsScreen> {
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _gstCtrl = TextEditingController();
  final _panCtrl = TextEditingController();
  final _aadharCtrl = TextEditingController();
  final _notesCtrl = TextEditingController(); // ----NEW----

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _gstCtrl.dispose();
    _panCtrl.dispose();
    _aadharCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showBackButton: true,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE9E9E9),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MEMBER DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),

              _roundedTextField(_nameCtrl, 'Member Name'),
              _roundedTextField(_phoneCtrl, 'Phone Number', keyboardType: TextInputType.phone),
              _roundedTextField(_emailCtrl, 'Email', keyboardType: TextInputType.emailAddress),
              _roundedTextField(_gstCtrl, 'GST#'),
              _roundedTextField(_panCtrl, 'PAN#'),
              _roundedTextField(_aadharCtrl, 'Aadhar#'),

              const SizedBox(height: 16),

              // ----NEW---- Additional Notes
              _roundedTextArea(_notesCtrl, 'Additional Notes'),

              const SizedBox(height: 16),

              // ----NEW---- Action buttons
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  _pillButton(
                    label: 'REJECT',
                    background: Colors.black,
                    onPressed: () => Navigator.pop(context, 'rejected'),
                  ),
                  _pillButton(
                    label: 'APPROVE',
                    background: const Color(0xFF2E74B6),
                    onPressed: () => Navigator.pop(context, 'approved'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roundedTextField(
      TextEditingController controller,
      String hint, {
        TextInputType? keyboardType,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: const Icon(Icons.edit, color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _roundedTextArea(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        maxLines: 5,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _pillButton({
    required String label,
    required Color background,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
      ),
      child: Text(label),
    );
  }
}
