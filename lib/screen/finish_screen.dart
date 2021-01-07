import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  static const routeName = './finish_screen';
  @override
  Widget build(BuildContext context) {
    print('${ModalRoute.of(context).settings.arguments}個正解');
    return Scaffold(
      appBar: AppBar(title: Text('result')),
      body: Container(),
    );
  }
}
