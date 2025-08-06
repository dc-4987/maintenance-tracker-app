// Category tabs (“All / Vehicles / Equipment / Tools”)• List-or-grid toggle• Asset cards w/ next-due badge
// App bar:  Filter ▾ (category, status)• Sort ▾ (name, hours)
import 'package:flutter/material.dart';

class GarageScreen extends StatelessWidget {
  const GarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const Center(
        child: Text(
          'All vehicles, equip, tools go here',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
