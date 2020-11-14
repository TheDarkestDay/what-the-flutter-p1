import 'package:flutter/material.dart';
import 'package:what_the_flutter_p1/words-list.dart';

import 'word.dart';

class WordsForToday extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WordsForTodayState();
}

class _WordsForTodayState extends State<WordsForToday> {
  final List<Word> words = [
    Word(text: 'taciturn'),
    Word(text: 'peril'),
    Word(text: 'abandon'),
  ];

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
      child: WordsList(
        words: words,
        onUsageTracked: trackWordUsage,
      ),
    );
  }
}
