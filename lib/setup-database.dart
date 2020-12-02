import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> setupDatabase() async {
  return openDatabase(join(await getDatabasesPath(), 'active-vocabulary.db'),
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE Words(id INTEGER PRIMARY KEY autoincrement, text TEXT, usageCount INTEGER)');
  }, version: 1);
}
