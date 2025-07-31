import 'package:flutter/foundation.dart';

import '../models/equipment.dart';
import '../data/equipment_repository.dart';

class EquipmentProvider extends ChangeNotifier {
  final EquipmentRepository repository;
  List<Equipment> _equipment = [];

  EquipmentProvider(this.repository);

  List<Equipment> get equipment => _equipment;

  Future<void> load() async {
    // TODO: load equipment from repository
    _equipment = await repository.getAll();
    notifyListeners();
  }
}
