import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:what_the_flutter_p1/sql-query-helper.dart';
import 'package:what_the_flutter_p1/sql-query.dart';

Future<Database> setupDatabase() async {
  return openDatabase(join(await getDatabasesPath(), 'active-vocabulary.db'),
      onCreate: (db, version) {
    return db.execute(SqlQueryHelper.getQuery(SqlQuery.createWordsTable));
  }, version: 1);
}
