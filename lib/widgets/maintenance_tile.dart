import 'package:flutter/material.dart';

class MaintenanceTile extends StatelessWidget {
  final String title;

  const MaintenanceTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title));
  }
}
