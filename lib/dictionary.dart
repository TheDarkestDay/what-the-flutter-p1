import 'package:flutter/material.dart';
import 'package:what_the_flutter_p1/word-field.dart';
import 'package:what_the_flutter_p1/word.dart';

class Dictionary extends StatefulWidget {
  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  final List<Word> words = [];

  handleWordAdded(String newWordText) {
    setState(() {
      final newWord = Word(text: newWordText);

      words.add(newWord);
    });
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
              onWordAdded: handleWordAdded,
            ),
          ),
          Expanded(
              child: ListView(
            children: words
                .map((word) => Card(
                      child: ListTile(
                        title: Text(word.text),
                      ),
                    ))
                .toList(),
          ))
        ],
      ),
    );
  }
}
