import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('start'),
                elevation: 0,
                onPressed: () => Provider.of<BarleyBreakProvider>(context,listen: false).start(),
              ),
              SizedBox(width: 16),
              RaisedButton(
                child: Text('reset'),
                elevation: 0,
                onPressed: () => Provider.of<BarleyBreakProvider>(context,listen: false).init(),
              ),
            ]
          ),
          GameScreen(),
        ]
      )
    );
  }
}