import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue), child: Text('Menu')),
        ListTile(
            leading: Icon(Icons.book),
            title: Text('Dictionary'),
            onTap: () => this._navigateTo(context, '/dictionary')),
        ListTile(
          leading: Icon(Icons.translate),
          title: Text('Words for today'),
          onTap: () => this._navigateTo(context, '/'),
        ),
      ],
    ));
  }
}
