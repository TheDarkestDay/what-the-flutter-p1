import 'package:what_the_flutter_p1/sql-query.dart';

class SqlQueryHelper {
  static String getQuery(SqlQuery query) {
    switch (query) {
      case SqlQuery.createWordsTable:
        return 'CREATE TABLE Words(id INTEGER PRIMARY KEY autoincrement, text TEXT, usageCount INTEGER)';
    }
  }
}
