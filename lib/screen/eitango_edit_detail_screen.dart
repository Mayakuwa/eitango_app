import 'package:flutter/material.dart';

class EitangoEditDetailScreen extends StatefulWidget {
  static const routeName = './eitango_edit_detail_screen';

  @override
  _EitangoEditDetailScreenState createState() => _EitangoEditDetailScreenState();
}

class _EitangoEditDetailScreenState extends State<EitangoEditDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final String item  = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('EditDetail')),
      body: Container(
        child: Text(item),
      ),
    );
  }
}
