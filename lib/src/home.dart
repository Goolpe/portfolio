import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                color: Colors.green,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text('lol'),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: ['Home','About','Experience','Portfolio','Contact'].map((String i) => 
                        FlatButton(
                          child: Text(i),
                          onPressed: (){},
                        ),
                      ).toList()
                    ),
                  )
                ],
              )
            ),
          ),
        ]
      ),
    );
  }
}
