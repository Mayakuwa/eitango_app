import 'package:flutter/material.dart';

class SimpleTile extends StatelessWidget {

  SimpleTile({
    @required this.item,
    this.onPress
  });

  final String item;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child: ListTile(
        title: Text(
          item,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18
          ),
        ),
        onTap: onPress,
      ),
    );;
  }
}
