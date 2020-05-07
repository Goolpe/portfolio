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
          builder: (context, value, _) {
            return MediaQuery.of(context).orientation == Orientation.landscape
            ? Row(
              children: _listHome(value)
            )
            : ListView(
              children: _listHome(value)
            );
          }
        )
      )
    );
  }

  List<Widget> _listHome(value){
    return <Widget>[
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PortfolioListCard(
              title: 'Commercial Apps', 
              cards: value.cardsStore
            ),
            PortfolioListCard(
              title: 'Other', 
              cards: value.cardsOther
            ),
          ],
        ),
      ),
      if(value.screen != null)
        Expanded(
          child: value.screen
        )
    ];
  }
}