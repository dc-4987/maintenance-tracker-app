import 'package:flutter/foundation.dart';

import '../models/maintenance_task.dart';
import '../data/maintenance_repository.dart';

class MaintenanceProvider extends ChangeNotifier {
  final MaintenanceRepository repository;
  List<MaintenanceTask> _tasks = [];

  MaintenanceProvider(this.repository);

  List<MaintenanceTask> get tasks => _tasks;

  Future<void> load(int equipmentId) async {
    // TODO: load tasks for equipment
    _tasks = await repository.getByEquipment(equipmentId);
    notifyListeners();
  }
}
