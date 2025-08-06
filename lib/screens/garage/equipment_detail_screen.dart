import 'package:flutter/material.dart';

class EquipmentDetailScreen extends StatelessWidget {
  const EquipmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Equipment Detail')),
      body: const Center(child: Text('Equipment details go here')),
    );
  }
}

//  Header banner (photo, category badge)• Usage gauge• Task list for this asset• History mini-timeline
// • Edit ✎• Archive 🗄
// Optional: Detailed history - • Date separators• Icons for “usage”, “task done”, “note” • Export ↧• Delete older than… 🗑
