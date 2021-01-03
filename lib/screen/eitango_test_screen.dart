import 'package:flutter/material.dart';
import 'package:eitango_app/brain/question_brain.dart';
import 'package:eitango_app/widget/answer_tile.dart';

QuestionBrain questionBrain = QuestionBrain();

class EitangoTestScreen extends StatefulWidget {
  static const routeName= './eitango_test_screen';
  @override
  _EitangoTestScreenState createState() => _EitangoTestScreenState();
}

class _EitangoTestScreenState extends State<EitangoTestScreen> {
  @override
  Widget build(BuildContext context) {
    // get random list
    List<int> list = questionBrain.createRandomAnswer(questionBrain.getWordIndex());
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.cancel_outlined, color: Colors.white),
              onPressed: null
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                questionBrain.getWordToEnglish(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey
                ),
              ),
            ),
          ),
          AnswerTile(listIndex: list[0], questionBrain: questionBrain),
          AnswerTile(listIndex: list[1], questionBrain: questionBrain),
          AnswerTile(listIndex: list[2], questionBrain: questionBrain),
          AnswerTile(listIndex: list[3], questionBrain: questionBrain),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}

// class AnswerTile extends StatelessWidget {
//   @required int listIndex;
//   @required QuestionBrain questionBrain;
//
//   AnswerTile({
//     this.listIndex,
//     this.questionBrain
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: FlatButton(
//           minWidth: 300,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10))
//           ),
//           color: Colors.amber,
//           child: Text(
//             questionBrain.getWordJapanese(listIndex),
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: 40
//             ),
//           ),
//           onPressed: () {
//
//           },
//         ),
//       ),
//     );
//   }
// }
