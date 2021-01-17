import 'package:eitango_app/brain/question_brain.dart';
import 'package:flutter/material.dart';

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
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(item.toString()),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  //add delete function to ather
                  questionBrain.getQuestionList().removeAt(index);
                });

                // Then show a snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red),
              child: ListTile(title: Text('$item')),
            );
            // return Container(
            //   decoration: new BoxDecoration(
            //       border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
            //   ),
            //   child:ListTile(
            //     title: Text(
            //       questionBrain.getEnglishWordByIndex(index),
            //       style: TextStyle(
            //           color:Colors.black,
            //           fontSize: 18.0
            //       ),
            //     ),
            //     onTap: () {
            //       print("onTap called.");
            //     }, // タップ
            //     onLongPress: () {
            //       print("onLongTap called.");
            //     }, // 長押し
            //   ),
            // );
            // return Text(questionBrain.getEnglishWordByIndex(index));
          }
      )
    );
  }
}
