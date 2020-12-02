import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:what_the_flutter_p1/word.dart';
import 'package:what_the_flutter_p1/words-storage.dart';

class WordsProvider extends ChangeNotifier {
  WordsStorage storage;

  List<Word> words = [];

  WordsProvider setStorage(WordsStorage storage) {
    this.storage = storage;

    if (storage != null) {
      storage.getWords().then((value) {
        words = value;

        notifyListeners();
      });
    }

    return this;
  }

  void addNewWord(String wordText) async {
    if (storage == null) {
      return;
    }

    final newWord = await storage.addNewWord(wordText);
    words.add(newWord);

    notifyListeners();
  }

  void trackWordUsage(Word word) async {
    if (storage == null) {
      return;
    }

    word.trackUsage();
    await storage.updateWord(word);

    notifyListeners();
  }

  List<Word> getWords() {
    return words;
  }
}
