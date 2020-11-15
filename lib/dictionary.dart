import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_the_flutter_p1/word-field.dart';
import 'package:what_the_flutter_p1/word.dart';
import 'package:what_the_flutter_p1/words-provider.dart';

class Dictionary extends StatelessWidget {
  final List<Word> words = [];

  handleWordAdded(BuildContext context, String newWordText) {
    Provider.of<WordsProvider>(context, listen: false).addNewWord(newWordText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: WordField(
              onWordAdded: (newWordText) =>
                  handleWordAdded(context, newWordText),
            ),
          ),
          Expanded(
              child: Consumer<WordsProvider>(builder: (context, model, value) {
            return ListView(
              children: model
                  .getWords()
                  .map((word) => Card(
                        child: ListTile(
                          title: Text(word.text),
                        ),
                      ))
                  .toList(),
            );
          })),
        ],
      ),
    );
  }
}
