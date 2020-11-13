import 'package:flutter/material.dart';
import 'package:what_the_flutter_p1/tapable-card.dart';

class WordCard extends StatelessWidget {
  final List<Widget> children;

  final void Function() onTap;

  WordCard({this.children, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TapableCard(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: children,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
