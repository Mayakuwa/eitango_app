import 'package:flutter/material.dart';
import 'package:eitango_app/brain/question_brain.dart';
import 'package:eitango_app/widget/answer_tile.dart';
import 'package:flare_flutter/flare_actor.dart';

QuestionBrain questionBrain = QuestionBrain();


class EitangoTestScreen extends StatefulWidget {
  static const routeName= './eitango_test_screen';
  @override
  _EitangoTestScreenState createState() => _EitangoTestScreenState();
}

class _EitangoTestScreenState extends State<EitangoTestScreen> {
  List<Icon> scoreKeeper = [];

  void hello() {
    print('hello');
    scoreKeeper.add(Icon(Icons.check, color: Colors.red));
  }

  void checkedAnswer(String word) async {
    if(questionBrain.getWordToJapanese() == word) {
      // show true Snackbar
      await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: SizedBox(
                height: 60,
                child: FlareActor(
                  'images/SuccessCheck.flr',
                  alignment: Alignment.center,
                  animation: 'Untitled',
                  fit: BoxFit.contain
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('テストメッセージ')
                ],
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('ok'),
                ),
                FlatButton(
                  onPressed: () {
                    // go to dictionary
                  },
                  child: Text('go to dictionary'),
                )
              ],
            );
          }
      );
      // go to next question
      questionBrain.nextQuestion();
      print('true');
      // add score kipper
      setState(() {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      });
    } else {
      // show false SnackBar
      questionBrain.nextQuestion();
      print('false');
      setState(() {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          AnswerTile(listIndex: list[0], questionBrain: questionBrain, onPress: () => checkedAnswer(questionBrain.getJapaneseWordByIndex(list[0]))),
          AnswerTile(listIndex: list[1], questionBrain: questionBrain, onPress: () => checkedAnswer(questionBrain.getJapaneseWordByIndex(list[1]))),
          AnswerTile(listIndex: list[2], questionBrain: questionBrain, onPress: () => checkedAnswer(questionBrain.getJapaneseWordByIndex(list[2]))),
          AnswerTile(listIndex: list[3], questionBrain: questionBrain, onPress: () => checkedAnswer(questionBrain.getJapaneseWordByIndex(list[3]))),
          Row(children: scoreKeeper),
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
