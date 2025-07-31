import 'package:flutter/material.dart';

class MaintenanceFormScreen extends StatelessWidget {
  const MaintenanceFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maintenance Task')),
      body: const Center(child: Text('Maintenance form goes here')),
    );
  }
}
