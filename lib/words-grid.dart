import 'package:flutter/material.dart';

class WordsGrid extends StatelessWidget {
  final List<Widget> children;

  WordsGrid({this.children});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: children,
    );
  }
}
