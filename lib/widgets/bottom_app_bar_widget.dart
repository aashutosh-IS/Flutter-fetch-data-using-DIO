import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatelessWidget {
  final String title;
  final IconData iconName;
  final Function onPressed;

  BottomAppBarWidget({this.title, this.iconName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(iconName),
          onPressed: onPressed,
        ),
        Text("$title"),
      ],
    );
  }
}
