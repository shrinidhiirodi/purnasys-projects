import 'package:flutter/material.dart';
import '../common/widgets/base_screen.dart'; // ----CHANGED----
import 'team_member_details_screen.dart';   // ----CHANGED----
import '../../models/team_member.dart';
class TeamDetailsScreen extends StatefulWidget { // ----CHANGED----
  const TeamDetailsScreen({super.key});

  @override
  State<TeamDetailsScreen> createState() => _TeamDetailsScreenState(); // ----CHANGED----
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen> { // ----CHANGED----
  // Dropdown + form state
  final List<String> _orgs = const [
    'Organization Name',
    'e-Purna Foods Pvt Ltd',
    'Purna Organics LLP',
    'Sirodi Agri Co-op',
  ];
  String? _selectedOrg;

  final _teamNameCtrl = TextEditingController();
  final _teamLeaderCtrl = TextEditingController();
  final _contactCtrl = TextEditingController();
  final _mailCtrl = TextEditingController();

  // ----CHANGED---- Members list now stores full TeamMember objects
  final List<TeamMember> _members = <TeamMember>[
    const TeamMember(name: 'Member A', phone: '', email: '', gst: '', pan: '', aadhar: ''),
    const TeamMember(name: 'Team Name', phone: '', email: '', gst: '', pan: '', aadhar: ''),
    const TeamMember(name: 'Team Name', phone: '', email: '', gst: '', pan: '', aadhar: ''),
    const TeamMember(name: 'Team Name', phone: '', email: '', gst: '', pan: '', aadhar: ''),
    const TeamMember(name: 'Team Name', phone: '', email: '', gst: '', pan: '', aadhar: ''),
  ];

  @override
  void initState() {
    super.initState();
    _selectedOrg = _orgs.first;
  }

  @override
  void dispose() {
    _teamNameCtrl.dispose();
    _teamLeaderCtrl.dispose();
    _contactCtrl.dispose();
    _mailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen( // ----CHANGED----
      child: SingleChildScrollView( // ----CHANGED----
        padding: EdgeInsets.only(
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Card 1: Team form =====
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Team Name',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Organization dropdown
                  _roundedField(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedOrg,
                        icon: const Icon(Icons.expand_more),
                        items: _orgs
                            .map((o) => DropdownMenuItem(
                          value: o,
                          child: Text(o),
                        ))
                            .toList(),
                        onChanged: (v) => setState(() => _selectedOrg = v),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  _roundedTextField(
                    controller: _teamNameCtrl,
                    hint: 'Team Name',
                  ),
                  const SizedBox(height: 12),
                  _roundedTextField(
                    controller: _teamLeaderCtrl,
                    hint: 'Team Leader',
                  ),
                  const SizedBox(height: 12),
                  _roundedTextField(
                    controller: _contactCtrl,
                    hint: 'Contact Number',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 12),
                  _roundedTextField(
                    controller: _mailCtrl,
                    hint: 'Mail id',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),

                  // Buttons (wrap to avoid overflow)
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      _pillButton(
                        label: 'CANCEL',
                        background: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      _pillButton(
                        label: 'SAVE',
                        background: const Color(0xFF2E74B6),
                        onPressed: _onSave,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ===== Card 2: Members =====
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Members',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: _addMember, // ----CHANGED----
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // ----CHANGED---- Render each TeamMember; tap to edit
                  ..._members.asMap().entries.map(
                        (entry) {
                      final idx = entry.key;
                      final member = entry.value;
                      final isLast = idx == _members.length - 1;
                      return InkWell(
                        onTap: () => _editMember(idx, member), // ----CHANGED----
                        child: _memberTile(
                          member: member,
                          showDivider: !isLast,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==== Helpers ====

  Widget _roundedField({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }

  Widget _roundedTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        suffixIcon: const Icon(Icons.edit, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
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

  // ----CHANGED---- Member tile now takes a TeamMember
  Widget _memberTile({required TeamMember member, bool showDivider = true}) {
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
              Expanded(child: Text(member.name)),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
        if (showDivider)
          const Divider(height: 12, thickness: 0.8, color: Color(0xFFDDDDDD)),
      ],
    );
  }

  // ----CHANGED---- Add new member flow
  Future<void> _addMember() async {
    final result = await Navigator.push<TeamMember>(
      context,
      MaterialPageRoute(builder: (_) => const TeamMemberDetailsScreen()),
    );
    if (result != null) {
      setState(() => _members.add(result));
    }
  }

  // ----CHANGED---- Edit member flow
  Future<void> _editMember(int index, TeamMember existing) async {
    final updated = await Navigator.push<TeamMember>(
      context,
      MaterialPageRoute(
        builder: (_) => TeamMemberDetailsScreen(initial: existing),
      ),
    );
    if (updated != null) {
      setState(() => _members[index] = updated);
    }
  }

  void _onSave() {
    // Minimal validation; extend as needed.
    if ((_selectedOrg ?? _orgs.first) == _orgs.first ||
        _teamNameCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete required fields')),
      );
      return;
    }
    // TODO: Submit to backend (team + _members)
  }
}
