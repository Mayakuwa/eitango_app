import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FinishScreen extends StatelessWidget {
  static const routeName = './finish_screen';
  @override
  Widget build(BuildContext context) {
    final correctAnswer = ModalRoute.of(context).settings.arguments;
    print('$correctAnswer個正解');
    return Scaffold(
      appBar: AppBar(title: Text('result')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FlareActor(
              'images/Trofeo.flr',
              alignment: Alignment.center,
              animation: 'Untitled',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Text(
              '$correctAnswer個正解です！',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
            ),
          )
        ],
      )
    );
  }
}
