import 'package:flutter/material.dart';
import 'package:what_the_flutter_p1/word-field.dart';
import 'package:what_the_flutter_p1/words-list.dart';

class Word {
  String text;

  int usageCount;

  Word({this.text, this.usageCount});
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Word> words = [];

  addWord(String newWordText) {
    setState(() {
      Word newWord = Word(text: newWordText, usageCount: 0);

      words.add(newWord);
    });
  }

  trackWordUsage(String wordText) {
    setState(() {
      Word wordToTrack = words.firstWhere((word) => word.text == wordText);

      wordToTrack.usageCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          WordField(
            onWordAdded: addWord,
          ),
          WordsList(
            words: words,
            onUsageTracked: trackWordUsage,
          )
        ],
      ),
    );
  }
}
