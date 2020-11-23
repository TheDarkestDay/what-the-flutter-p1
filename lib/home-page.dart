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

/**
 * The time has come to split our components apart.
 * 
 * The only guid you might require for this exercise is here:
 * https://flutter.dev/docs/cookbook/navigation/named-routes
 * 
 * However, if you feel that named routes are not your thing, you can 
 * accomplish the same via regular Widget-based navigation:
 * https://flutter.dev/docs/cookbook/navigation/navigation-basics
 */
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
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: WordField(
              onWordAdded: addWord,
            ),
          ),
          Expanded(
            child: WordsList(
              words: words,
              onUsageTracked: trackWordUsage,
            ),
          ),
        ],
      ),
    );
  }
}
