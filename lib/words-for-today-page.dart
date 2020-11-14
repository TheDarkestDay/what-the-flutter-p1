import 'package:flutter/material.dart';
import 'package:what_the_flutter_p1/app-drawer.dart';
import 'package:what_the_flutter_p1/words-for-today.dart';

class WordsForTodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Words for today')),
        drawer: AppDrawer(),
        body: WordsForToday());
  }
}
