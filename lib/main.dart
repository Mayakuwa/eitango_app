import 'package:eitango_app/screen/choose_screen.dart';
import 'package:eitango_app/screen/eitango_test_screen.dart';
import 'package:flutter/material.dart';
import 'package:eitango_app/brain/question_brain.dart';

void main() {
  runApp(MyApp());
}

QuestionBrain questionBrain = QuestionBrain();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // get random list
    List<int> list = questionBrain.createRandomAnswer();
    print(list);
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryTextTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.white
            )
        ),
        primaryColor: Colors.amber,
        accentColor: Colors.lightGreenAccent,
      ),
      home: ChooseScreen(),
      routes: {
        ChooseScreen.routeName: (ctx) => ChooseScreen(),
        EitangoTestScreen.routeName: (ctx) => EitangoTestScreen()
      },
    );
  }
}
