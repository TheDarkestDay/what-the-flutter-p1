import 'package:flutter/material.dart';
import 'package:what_the_flutter_p1/word-card.dart';
import 'package:what_the_flutter_p1/words-grid.dart';

import 'word.dart';

class WordsList extends StatelessWidget {
  final List<Word> words;

  final void Function(Word word) onUsageTracked;

  WordsList({this.words, this.onUsageTracked});

  handleWordCardTap(Word word) {
    onUsageTracked(word);
  }

  @override
  Widget build(BuildContext context) {
    return WordsGrid(
        children: words
            .map(
              (word) =>
                  WordCard(onTap: () => handleWordCardTap(word), children: [
                Text(
                  word.text,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  word.usageCount.toString(),
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                Text('time(s) used'),
              ]),
            )
            .toList());
  }
}
