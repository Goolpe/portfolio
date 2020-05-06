import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
          children: <Widget>[
            RaisedButton(
              child: Text('start'),
              elevation: 0,
              onPressed: (){},
            ),
            GameScreen(),
          ]
      )
    );
  }
}