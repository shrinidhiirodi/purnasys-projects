import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import '../common/widgets/base_screen.dart';

class CreateProductScreen extends StatefulWidget { // ----CHANGED----
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState(); // ----CHANGED----
}

class _CreateProductScreenState extends State<CreateProductScreen> { // ----CHANGED----
  // ----CHANGED---- Controllers & state
  final TextEditingController _productNameCtrl = TextEditingController();
  final TextEditingController _categoryCtrl = TextEditingController();
  final TextEditingController _mfgDateCtrl = TextEditingController();
  final TextEditingController _expDateCtrl = TextEditingController();
  final TextEditingController _sizeValueCtrl = TextEditingController();
  final TextEditingController _qtyCtrl = TextEditingController();
  final TextEditingController _discountCtrl = TextEditingController();

  final List<String> _orgs = const [
    'Select Organization Name', // placeholder
    'e-Purna Foods Pvt Ltd',
    'Purna Organics LLP',
    'Sirodi Agri Co-op',
  ];
  String? _selectedOrg; // ----CHANGED----

  final List<String> _sizeUnits = const ['l', 'ml', 'kg', 'g']; // ----CHANGED----
  String _selectedUnit = 'ml'; // ----CHANGED----

  @override
  void initState() {
    super.initState();
    _selectedOrg = _orgs.first; // ----CHANGED----
  }

  @override
  void dispose() {
    _productNameCtrl.dispose();
    _categoryCtrl.dispose();
    _mfgDateCtrl.dispose();
    _expDateCtrl.dispose();
    _sizeValueCtrl.dispose();
    _qtyCtrl.dispose();
    _discountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showBackButton: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth =
          ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24), // spacing at bottom
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Form Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Create Product',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // ----CHANGED---- Organization dropdown (rounded like text fields)
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

                          // ----CHANGED---- Product Name & Category
                          _roundedTextField(
                            controller: _productNameCtrl,
                            hint: 'Product Name',
                          ),
                          const SizedBox(height: 12),
                          _roundedTextField(
                            controller: _categoryCtrl,
                            hint: 'Product Category',
                          ),
                          const SizedBox(height: 12),

                          // ----CHANGED---- Mfg & Expiry with calendar pickers
                          Row(
                            children: [
                              Expanded(
                                child: _roundedTextField(
                                  controller: _mfgDateCtrl,
                                  hint: 'Manufactured Date',
                                  readOnly: true,
                                  suffixIcon: const Icon(Icons.calendar_today),
                                  onTap: () => _pickDate(context, _mfgDateCtrl),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _roundedTextField(
                                  controller: _expDateCtrl,
                                  hint: 'Expiry Date',
                                  readOnly: true,
                                  suffixIcon: const Icon(Icons.calendar_today),
                                  onTap: () => _pickDate(context, _expDateCtrl),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // ----CHANGED---- Size (value + unit chips)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Size (l/ml/kg/g)',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: _pillTextField(
                                      controller: _sizeValueCtrl,
                                      hint: 'Size',
                                      keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: _sizeUnits
                                          .map(
                                            (u) => ChoiceChip(
                                          label: Text(u),
                                          selected: _selectedUnit == u,
                                          onSelected: (_) => setState(
                                                  () => _selectedUnit = u),
                                          shape: StadiumBorder(
                                            side: BorderSide(
                                                color: _selectedUnit == u
                                                    ? Colors.blue
                                                    : Colors.grey.shade400),
                                          ),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // ----CHANGED---- Quantity & Discount “pills”
                          Row(
                            children: [
                              Expanded(
                                child: _pillTextField(
                                  controller: _qtyCtrl,
                                  hint: 'Quantity',
                                  keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: false),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _pillTextField(
                                  controller: _discountCtrl,
                                  hint: 'Discount',
                                  keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                                  suffixText: '%',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Upload Images
                          Row(
                            children: [
                              Expanded(child: _uploadBox('Upload Image')),
                              const SizedBox(width: 8),
                              Expanded(child: _uploadBox('Upload Image')),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Upload Video
                          _uploadBox('Upload Video', isFullWidth: true),
                          const SizedBox(height: 20),

                          // ----CHANGED---- Responsive Buttons (no overflow)
                          Wrap(
                            spacing: 16,
                            runSpacing: 12,
                            alignment: WrapAlignment.start,
                            children: [
                              _actionButton(
                                label: 'CANCEL',
                                background: Colors.black,
                                onPressed: () => Navigator.pop(context),
                              ),
                              _actionButton(
                                label: 'CREATE',
                                background: Colors.blue,
                                onPressed: _onCreatePressed,
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

  // ----CHANGED---- Helpers

  Future<void> _pickDate(
      BuildContext context, TextEditingController target) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(now.year + 10),
    );
    if (picked != null) {
      target.text = _formatDate(picked);
    }
  }

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}-${d.month.toString().padLeft(2, '0')}-${d.year}';

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
    bool readOnly = false,
    Widget? suffixIcon,
    VoidCallback? onTap,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  Widget _pillTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
    String? suffixText,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        suffixText: suffixText,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
      ),
    );
  }

  Widget _uploadBox(String label, {bool isFullWidth = false}) {
    return GestureDetector(
      onTap: () {
        // TODO: open picker
      },
      child: Container(
        width: isFullWidth ? double.infinity : null,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add),
            const SizedBox(height: 4),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _actionButton({
    required String label,
    required Color background,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }

  void _onCreatePressed() {
    // TODO: wire to your create logic / validation
    // Example quick check (optional):
    if ((_selectedOrg ?? _orgs.first) == _orgs.first ||
        _productNameCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill required fields')),
      );
      return;
    }
    // Submit payload...
  }
}
