import 'package:flutter/material.dart';

class WordField extends StatefulWidget {
  final void Function(String value) onWordAdded;

  WordField({this.onWordAdded});

  @override
  State<StatefulWidget> createState() =>
      _WordFieldState(onWordAdded: onWordAdded);
}

class _WordFieldState extends State<WordField> {
  final _fieldController = TextEditingController();

  final void Function(String value) onWordAdded;

  _WordFieldState({this.onWordAdded});

  handleAddWordButtonClick() {
    onWordAdded(_fieldController.text);

    _fieldController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _fieldController.dispose();
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
