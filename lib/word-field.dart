import 'package:flutter/material.dart';

class WordField extends StatelessWidget {
  final _fieldController = TextEditingController();

  void Function(String value) onWordAdded;

  WordField({this.onWordAdded});

  handleAddWordButtonClick() {
    onWordAdded(_fieldController.text);

    _fieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: TextField(
            controller: _fieldController,
          ),
          width: 200,
        ),
        RaisedButton(
          onPressed: handleAddWordButtonClick,
          child: Icon(Icons.add),
        )
      ],
    );
  }
}
