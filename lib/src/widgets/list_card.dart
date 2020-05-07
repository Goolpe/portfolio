import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';

class PortfolioListCard extends StatelessWidget {
  PortfolioListCard({
    @required this.title,
    @required this.cards
  });

  final String title;
  final List<PortfolioCard> cards;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(title, style: TextStyle(
              fontSize: 30
            )),
          ),
          Divider(),
          MediaQuery.of(context).orientation == Orientation.landscape 
          ? SizedBox(
            height: 250,
            child: ListView(
              shrinkWrap: true,
              children: cards,
              scrollDirection: Axis.horizontal,
            ),
          )
          : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              childAspectRatio: 1/1.2
            ),
            itemCount: cards.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (context, index) => cards[index]
          )
        ]
      ),
    );
  }
}