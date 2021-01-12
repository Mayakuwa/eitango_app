import 'package:eitango_app/screen/finish_screen.dart';
import 'package:flutter/material.dart';
import 'package:eitango_app/brain/question_brain.dart';
import 'package:eitango_app/widget/answer_tile.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:url_launcher/url_launcher.dart';

QuestionBrain questionBrain = QuestionBrain();


class EitangoTestScreen extends StatefulWidget {
  static const routeName= './eitango_test_screen';
  @override
  _EitangoTestScreenState createState() => _EitangoTestScreenState();
}

class _EitangoTestScreenState extends State<EitangoTestScreen> {
  List<Icon> scoreKeeper = [];
  int correctAnswerCounter = 0;

  void launchURL(String correctWord) async {
    final url = 'https://ejje.weblio.jp/content/${correctWord}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> showAnswerDialog (bool check, String correctWord) async {
       await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: SizedBox(
                height: 60,
                child: FlareActor(
                    check ? 'images/SuccessCheck.flr' : 'images/CloseIcon.flr',
                    alignment: Alignment.center,
                    animation: check ? 'Untitled' : 'Error',
                    fit: BoxFit.contain
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  check ? Text('正解！！') : Text('不正解！！')
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
                  onPressed: () => launchURL(correctWord),
                  child: Text('go to dictionary'),
                )
              ],
            );
          }
      );
      setState(() {
        if(check) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
          correctAnswerCounter++;
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }
        // check ? scoreKeeper.add(Icon(Icons.check, color: Colors.green))
        //     : scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        if (questionBrain.isfinishedQuestion()) {
          print('finish');
          Navigator.pushNamed(
              context,
              FinishScreen.routeName,
              arguments: correctAnswerCounter
          );
        } {
          questionBrain.nextQuestion();
        }
      });
  }

  void checkedAnswer(String word) {
    if(questionBrain.getWordToJapanese() == word) {
      // show true alert
      showAnswerDialog(true, questionBrain.getWordToEnglish());
      print('true');
    } else {
      // show false alert
      showAnswerDialog(false, questionBrain.getWordToEnglish());
      print('false');
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
