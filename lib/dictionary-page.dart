import 'package:flutter/material.dart';
import 'package:what_the_flutter_p1/dictionary.dart';

import 'app-drawer.dart';

class DictionaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dictionary')),
        drawer: AppDrawer(),
        body: Dictionary());
  }
}
