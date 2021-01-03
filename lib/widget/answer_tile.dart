import 'package:flutter/material.dart';
import 'package:eitango_app/brain/question_brain.dart';

class AnswerTile extends StatelessWidget {
  @required int listIndex;
  @required QuestionBrain questionBrain;

  AnswerTile({
    this.listIndex,
    this.questionBrain
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
            questionBrain.getWordJapanese(listIndex),
            style: TextStyle(
                color: Colors.grey,
                fontSize: 40
            ),
          ),
          onPressed: () {

          },
        ),
      ),
    );
  }
}