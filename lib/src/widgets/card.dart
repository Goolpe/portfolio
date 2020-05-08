import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class PortfolioCard extends StatelessWidget {
  PortfolioCard({
    this.details,
  });

  final PortfolioDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.all(16),
      child: Consumer<HomeProvider>(
        builder: (context, value, _) => 
          Container(
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
                Container(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(URL_ASSET + details.asset, fit: BoxFit.contain)
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => Provider.of<HomeProvider>(context,listen: false).show(details, context),
                    ),
                  ), 
                ),
              ],
            ),
          ),
      ),
    );
  }
}