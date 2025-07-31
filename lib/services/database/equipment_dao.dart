import 'package:sqflite/sqflite.dart';

import '../../models/equipment.dart';

class EquipmentDao {
  final Database db;

  EquipmentDao(this.db);

  Future<int> insert(Equipment equipment) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  Future<List<Equipment>> getAll() {
    // TODO: implement query
    throw UnimplementedError();
  }
}
