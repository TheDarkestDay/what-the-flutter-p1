import 'package:flutter/material.dart';
import 'package:what_the_flutter_p1/word.dart';

class WordsProvider extends ChangeNotifier {
  final List<Word> words = [];

  void addNewWord(String wordText) {
    final word = Word(text: wordText);

    words.add(word);

    notifyListeners();
  }

  void trackWordUsage(Word word) {
    word.trackUsage();

    notifyListeners();
  }

  List<Word> getWords() {
    return words;
  }
}
