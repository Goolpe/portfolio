import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';

class PortfolioListCard extends StatelessWidget {
  PortfolioListCard({
    @required this.title,
    @required this.details
  });

  final String title;
  final List<PortfolioDetails> details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(title, style: TextStyle(
              fontSize: 30
            )),
          ),
          MediaQuery.of(context).orientation == Orientation.landscape 
          ? SizedBox(
            height: 250,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: details.length,
              itemBuilder: (context, index) => PortfolioCard(details: details[index])
            ),
          )
          : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              childAspectRatio: 1/1.2
            ),
            itemCount: details.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (context, index) => PortfolioCard(details: details[index])
          )
        ]
      ),
    );
  }
}