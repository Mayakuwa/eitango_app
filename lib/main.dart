import 'package:eitango_app/screen/choose_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryTextTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.white
            )
        ),
        primarySwatch: Colors.amber,
        accentColor: Colors.lightGreenAccent,
      ),
      home: ChooseScreen(),
      routes: {
        ChooseScreen.routeName: (ctx) => ChooseScreen()
      },
    );
  }
}
