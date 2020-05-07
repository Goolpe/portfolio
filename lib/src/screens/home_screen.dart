import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final List<PortfolioCard> _cardsStore = [
      PortfolioCard(
        asset: 'assets/barley_break.png', 
        name: 'Barley Break', 
        child: BarleyScreen()
      ),
      PortfolioCard(
        asset: 'assets/nevoffice.webp', 
        name: 'Не в офисе\n[Out of office]', 
      ),
      PortfolioCard(
        asset: 'assets/sprout.webp', 
        name: 'Росток\n[Sprout]', 
      ),
      PortfolioCard(
        asset: 'assets/sprout_prom.webp', 
        name: 'Росток Пром.\n[Sprout Promoter]', 
      )
    ];

    final List<PortfolioListCard> _listCard = [
      PortfolioListCard(
        title: 'Apps', 
        cards: _cardsStore
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: _listCard
        )
      )
    );
  }
}