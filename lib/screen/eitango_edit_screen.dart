import 'package:eitango_app/brain/question_brain.dart';
import 'package:flutter/material.dart';
import 'package:eitango_app/widget/simple_tile.dart';

QuestionBrain questionBrain = QuestionBrain();

class EitangoEditScreen extends StatefulWidget {
  static const routeName = './eitango_edit_screen';
  @override
  _EitangoEditScreenState createState() => _EitangoEditScreenState();
}

class _EitangoEditScreenState extends State<EitangoEditScreen> {
  @override
  Widget build(BuildContext context) {
    print(questionBrain.getQuestionList());
    return Scaffold(
      appBar: AppBar(title: Text('Edit')),
      body: ListView.builder(
          itemCount: questionBrain.getQuestionList().length,
          itemBuilder: (BuildContext context, int index) {
            final item = questionBrain.getQuestionList()[index].englishWord;
            return SimpleTile(item: item, onPress:() => print(item));
          }
      )
    );
  }
}
