import 'package:flutter/material.dart';
import 'package:eitango_app/brain/question_brain.dart';

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
    print(list);
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
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                color: Colors.amber,
                child: Text(
                  questionBrain.getWordToJapanese(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 40
                  ),
                ),
                onPressed: () {

                },
              )
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  color: Colors.amber,
                  child: Text(
                    questionBrain.getWordToJapanese(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 40
                    ),
                  ),
                  onPressed: () {

                  },
                )
            ),
          ),
        ],
      ),
    );
  }
}
