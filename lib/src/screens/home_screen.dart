import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Consumer<HomeProvider>(
          builder: (context, HomeProvider value, _) {
            return MediaQuery.of(context).orientation == Orientation.portrait
              ? ListView(
                children: <Widget>[
                  SizedBox(
                    height: 130,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: value.cards.map((PortfolioDetails details){
                        return PortfolioCard(details: details);
                      }).toList(),
                    )
                  ),
                  value.screen
                ],
              )
              : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: value.cards.map((PortfolioDetails details){
                      return PortfolioCard(details: details);
                    }).toList(),
                  ),
                ),
                if(value.screen != null)
                  Expanded(
                    child: value.screen
                  )
              ]
            );
          }
        )
      )
    );
  }
}