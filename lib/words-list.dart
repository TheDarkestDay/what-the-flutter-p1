import 'package:flutter/material.dart';
import 'package:what_the_flutter_p1/home-page.dart';

class WordsList extends StatelessWidget {
  final List<Word> words;

  final void Function(String text) onUsageTracked;

  WordsList({this.words, this.onUsageTracked});

  handleTrackUsageButtonClick(String text) {
    onUsageTracked(text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: words
          .map((word) => Row(
                children: [
                  Text(word.text),
                  Text(word.usageCount.toString()),
                  RaisedButton(
                    onPressed: () => handleTrackUsageButtonClick(word.text),
                    child: Icon(Icons.plus_one),
                  )
                ],
              ))
          .toList(),
    );
  }
}
