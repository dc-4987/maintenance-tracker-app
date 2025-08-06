import 'package:flutter/material.dart';

/// Form used inside the draggable / fractional bottom‑sheet.
/// It stays scrollable and keyboard‑aware so it cooperates with the sheet sizes.
class EquipmentOnboardingFormScreen extends StatefulWidget {
  const EquipmentOnboardingFormScreen({super.key});

  @override
  State<EquipmentOnboardingFormScreen> createState() =>
      _EquipmentOnboardingFormScreenState();
}

class _EquipmentOnboardingFormScreenState
    extends State<EquipmentOnboardingFormScreen> {
  final _nameCtrl = TextEditingController();
  final _modelCtrl = TextEditingController();
  final _usageCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _modelCtrl.dispose();
    _usageCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    // TODO: validate & call your OpenAI service with collected data
    Navigator.pop(context); // Close the sheet for now
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text(
            'Add equipment',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Name
          TextField(
            controller: _nameCtrl,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          // Model / variant
          TextField(
            controller: _modelCtrl,
            decoration: const InputDecoration(
              labelText: 'Model / Variant',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          // Usage pattern
          TextField(
            controller: _usageCtrl,
            decoration: const InputDecoration(
              labelText: 'Typical usage (e.g. 2 h / week)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            icon: const Icon(Icons.auto_awesome),
            label: const Text('Generate maintenance plan'),
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
