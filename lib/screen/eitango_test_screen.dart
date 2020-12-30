import 'package:flutter/material.dart';

class EitangoTestScreen extends StatefulWidget {
  static const routeName= './eitango_test_screen';
  @override
  _EitangoTestScreenState createState() => _EitangoTestScreenState();
}

class _EitangoTestScreenState extends State<EitangoTestScreen> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
