import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_the_flutter_p1/words-list.dart';
import 'package:what_the_flutter_p1/words-provider.dart';

import 'word.dart';

class WordsForToday extends StatelessWidget {
  trackWordUsage(BuildContext context, Word word) {
    Provider.of<WordsProvider>(context, listen: false).trackWordUsage(word);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Consumer<WordsProvider>(builder: (context, model, value) {
        return WordsList(
          words: model.getWords(),
          onUsageTracked: (word) => trackWordUsage(context, word),
        );
      }),
    );
  }
}
