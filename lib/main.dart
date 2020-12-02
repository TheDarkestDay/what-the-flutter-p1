import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_the_flutter_p1/dictionary-page.dart';
import 'package:what_the_flutter_p1/local-db-words-storage.dart';
import 'package:what_the_flutter_p1/setup-database.dart';
import 'package:what_the_flutter_p1/words-for-today-page.dart';
import 'package:what_the_flutter_p1/words-provider.dart';
import 'package:what_the_flutter_p1/words-storage.dart';

void main() {
  runApp(App());
}

class AppStateWrapper extends StatelessWidget {
  final Widget child;

  AppStateWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<WordsStorage>(
          create: (context) async {
            final db = await setupDatabase();

            return LocalDbWordsStorage(db: db);
          },
        ),
        ChangeNotifierProxyProvider<WordsStorage, WordsProvider>(
            create: (context) => WordsProvider(),
            update: (context, wordsStorage, wordsProvider) =>
                wordsProvider.setStorage(wordsStorage)),
      ],
      child: child,
    );
  }
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          '/': (context) => WordsForTodayPage(),
          '/dictionary': (context) => DictionaryPage(),
        },
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
