

import 'package:flutter/material.dart';

class ChooseScreen extends StatelessWidget {

  static const routeName = './choose_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {})
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         Container(
             child: Padding(
               padding: EdgeInsets.all(20.0),
               child: FlatButton(
                 onPressed: () {},
                 color: Theme.of(context).accentColor,
                 child: Text(
                   '英単語学習開始！',
                   style: TextStyle(
                     color: Colors.grey,
                     fontSize: 30,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             )
         ),
          Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: FlatButton(
                  onPressed: () {},
                  color: Theme.of(context).accentColor,
                  child: Text(
                    '英単語追加',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
          )
        ],
      )
    );
  }
}
