import 'package:flutter/material.dart';
import 'package:eitango_app/brain/question_brain.dart';
import 'package:eitango_app/widget/answer_tile.dart';

QuestionBrain questionBrain = QuestionBrain();

enum Answers {
  YES,
  NO
}

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
    createDialogOption(BuildContext context, Answers answer, String str) {
      return new SimpleDialogOption(child: new Text(str),onPressed: (){Navigator.pop(context, answer);},);
    }

    if(questionBrain.getWordToJapanese() == word) {
      // show true Snackbar
      await showDialog<Answers>(
          context: context,
          builder: (BuildContext context) => new SimpleDialog(
            title: new Text('SimpleDialog'),
            children: <Widget>[
              createDialogOption(context, Answers.YES, 'Yes'),
              createDialogOption(context, Answers.NO, 'No')
            ],
          ),
      ).then((value) {
        switch(value) {
          case Answers.YES:
            break;
          case Answers.NO:
            Navigator.of(context).pop();
            break;
        }

      });
      questionBrain.nextQuestion();
      print('true');
      // add score kipper
      setState(() {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      });
    } else {
      // show false SnackBar
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
