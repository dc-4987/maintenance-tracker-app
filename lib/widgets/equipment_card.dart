import 'package:flutter/material.dart';

class EquipmentCard extends StatelessWidget {
  final String title;

  const EquipmentCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(title)),
    );
  }
}
