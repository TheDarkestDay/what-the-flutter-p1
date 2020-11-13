import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final void Function() onPressed;

  final Widget child;

  RoundedButton({this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(shape: CircleBorder()));
  }
}
