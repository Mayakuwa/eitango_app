import 'package:flutter/material.dart';
import 'package:eitango_app/brain/question_brain.dart';

class AnswerTile extends StatelessWidget {
  @required int listIndex;
  @required QuestionBrain questionBrain;
  @required Function onPress;

  AnswerTile({
    this.listIndex,
    this.questionBrain,
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FlatButton(
          minWidth: 300,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          color: Colors.amber,
          child: Text(
            questionBrain.getJapaneseWordByIndex(listIndex),
            style: TextStyle(
                color: Colors.grey,
                fontSize: 40
            ),
          ),
          onPressed: onPress,
        ),
      ),
    );
  }
}