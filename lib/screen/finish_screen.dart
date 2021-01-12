import 'package:eitango_app/screen/choose_screen.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FinishScreen extends StatelessWidget {
  static const routeName = './finish_screen';
  @override
  Widget build(BuildContext context) {
    final correctAnswer = ModalRoute.of(context).settings.arguments;
    print('$correctAnswer個正解');
    return Scaffold(
      appBar: AppBar(
          title: Text('result'),
          automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Container(
            height: 200,
            child: FlareActor(
              'images/Trofeo.flr',
              alignment: Alignment.center,
              animation: 'Untitled',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 40),
          Container(
            height: 200,
            child: Text(
              '$correctAnswer個正解です！',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
            ),
          ),
          Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName(ChooseScreen.routeName));
                  },
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'ホームに戻る',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ),
        ],
      )
    );
  }
}
