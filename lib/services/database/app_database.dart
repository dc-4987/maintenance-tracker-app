import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AppDatabase {
  static Future<Database> open() async {
    // TODO: implement database opening and initialization
    final documents = await getApplicationDocumentsDirectory();
    final path = join(documents.path, 'app.db');
    return openDatabase(path);
  }
}
