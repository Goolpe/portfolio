import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class G2048Screen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2048'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<G2048Provider>(
        builder: (context, value, _) =>
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: value.height,
                    width: value.width
                  ),
                  AnimatedPositioned(
                    left: value.left,
                    top: value.top,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.ease,
                    child: Container(
                      color: Colors.black,
                      height: value.step,
                      width: value.step,
                    ),
                  )
                ]
            ),
            onHorizontalDragUpdate: (DragUpdateDetails details) => 
              Provider.of<G2048Provider>(context, listen: false).move(details, G2048Direction.horizontal),
            onVerticalDragUpdate: (DragUpdateDetails details) =>
              Provider.of<G2048Provider>(context, listen: false).move(details, G2048Direction.vertical),
          )
        )
      )
    );
  }
}