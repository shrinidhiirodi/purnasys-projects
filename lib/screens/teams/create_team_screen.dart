import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import '../common/widgets/base_screen.dart';

class CreateTeamScreen extends StatefulWidget { // ----CHANGED----
  const CreateTeamScreen({super.key});

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState(); // ----CHANGED----
}

class _CreateTeamScreenState extends State<CreateTeamScreen> { // ----CHANGED----
  // ----CHANGED---- Controllers & dropdown state
  final TextEditingController _teamNameCtrl = TextEditingController();
  final TextEditingController _teamLeaderCtrl = TextEditingController();
  final TextEditingController _contactCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();

  final List<String> _orgs = const [
    'Select Organization Name',
    'e-Purna Foods Pvt Ltd',
    'Purna Organics LLP',
    'Sirodi Agri Co-op',
  ];
  String? _selectedOrg;

  @override
  void initState() {
    super.initState();
    _selectedOrg = _orgs.first; // default placeholder
  }

  @override
  void dispose() {
    _teamNameCtrl.dispose();
    _teamLeaderCtrl.dispose();
    _contactCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth =
          ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ----CHANGED---- Card container like Figma
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Create Team', // Figma heading
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // ----CHANGED---- Organization dropdown (rounded)
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
                                onChanged: (v) => setState(() {
                                  _selectedOrg = v;
                                }),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          // ----CHANGED---- Team fields per Figma
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
                            controller: _emailCtrl,
                            hint: 'Mail id',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),

                          // ----CHANGED---- Responsive buttons (prevent overflow)
                          Wrap(
                            spacing: 16,
                            runSpacing: 12,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 28,
                                    vertical: 12,
                                  ),
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: const Text('CANCEL'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 28,
                                    vertical: 12,
                                  ),
                                ),
                                onPressed: _onCreatePressed, // ----CHANGED----
                                child: const Text('CREATE'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ----CHANGED---- Helpers styled like other screens
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
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void _onCreatePressed() {
    // Minimal guard (extend with proper validation as needed)
    if ((_selectedOrg ?? _orgs.first) == _orgs.first ||
        _teamNameCtrl.text.trim().isEmpty ||
        _teamLeaderCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete required fields')),
      );
      return;
    }
    // TODO: Submit to backend
  }
}
