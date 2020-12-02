import 'package:sqflite/sqflite.dart';
import 'package:what_the_flutter_p1/word.dart';
import 'package:what_the_flutter_p1/words-storage.dart';

class LocalDbWordsStorage extends WordsStorage {
  final Database db;

  final TABLE_NAME = 'words';

  LocalDbWordsStorage({this.db});

  @override
  Future<Word> addNewWord(String text) async {
    final word = Word(text: text);

    final newWordId = await db.insert(TABLE_NAME, word.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    word.id = newWordId;

    return word;
  }

  @override
  Future<List<Word>> getWords() async {
    final List<Map<String, dynamic>> wordRecords = await db.query('words');

    return List.generate(wordRecords.length, (index) {
      final record = wordRecords[index];
      return Word(
          id: record['id'],
          text: record['text'],
          usageCount: record['usageCount']);
    });
  }

  @override
  Future<void> updateWord(Word word) async {
    await db.update(TABLE_NAME, word.toMap(),
        where: 'id = ?', whereArgs: [word.id]);
  }
}
