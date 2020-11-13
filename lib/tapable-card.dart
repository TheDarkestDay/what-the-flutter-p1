import 'package:flutter/material.dart';

class TapableCard extends StatelessWidget {
  final void Function() onTap;

  final Widget child;

  TapableCard({this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.blueAccent,
        child: child,
      ),
    );
  }
}
