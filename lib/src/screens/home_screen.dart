import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';

class HomeScreen extends StatelessWidget {
  final List<String> _names = ['Barley Break'];
  final List<String> _assets = ['assets/barley_break.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goolpe'),
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
        itemCount: _names.length,
        itemBuilder: (context, index) => 
        Container(
          margin: EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(
              color: Color(0xFF000000).withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2
            )]
          ),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    width: MediaQuery.of(context).size.width,
                    child: Text(_names[index], style: TextStyle(fontSize: 18),),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.2))
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset(_assets[index], fit: BoxFit.cover)
                    )
                  )
                ]
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) => BarleyScreen()
                      ));
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}