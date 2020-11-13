import 'package:flutter/material.dart';
import 'package:what_the_flutter_p1/outlined-text-field.dart';
import 'package:what_the_flutter_p1/rounded-button.dart';

class WordField extends StatelessWidget {
  final _fieldController = TextEditingController();

  final void Function(String value) onWordAdded;

  WordField({this.onWordAdded});

  handleAddWordButtonClick() {
    onWordAdded(_fieldController.text);

    _fieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: OutlinedTextField(
          controller: _fieldController,
        )),
        RoundedButton(
          onPressed: handleAddWordButtonClick,
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
