import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class PortfolioDialog extends StatelessWidget {
  PortfolioDialog({
    @required this.child,
    @required this.name,
    @required this.asset
  });

  final Widget child;
  final String name;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(asset, 
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      )
                    ),
                    SizedBox(width: 10),
                    Text(name,
                      style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
                Container(
                  height: 400,
                  width: 300,
                  margin: EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 6
                    )]
                  ),
                  alignment: Alignment.center,
                  child: child,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: (){
                          Provider.of<BarleyBreakProvider>(context, listen: false).pause();
                          Get.back();
                        },
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        margin: EdgeInsets.only(left: 14),
                        color: Colors.black,
                      ),
                      FlatButton(
                        child: Text('Details'),
                        onPressed: (){},
                      )
                    ],
                  ),
                ),
              ]
            ),
          )
        )
      ),
    );
  }
}