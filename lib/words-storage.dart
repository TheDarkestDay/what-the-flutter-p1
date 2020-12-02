import 'package:what_the_flutter_p1/word.dart';

abstract class WordsStorage {
  Future<List<Word>> getWords();

  Future<Word> addNewWord(String text);

  Future<void> updateWord(Word word);
}
