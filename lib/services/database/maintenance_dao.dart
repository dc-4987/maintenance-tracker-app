import 'package:sqflite/sqflite.dart';

import '../../models/maintenance_task.dart';

class MaintenanceDao {
  final Database db;

  MaintenanceDao(this.db);

  Future<int> insert(MaintenanceTask task) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  Future<List<MaintenanceTask>> getByEquipment(int equipmentId) {
    // TODO: implement query
    throw UnimplementedError();
  }
}
