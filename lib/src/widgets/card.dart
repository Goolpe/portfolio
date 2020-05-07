import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class PortfolioCard extends StatelessWidget {
  PortfolioCard({
    @required this.asset,
    @required this.name,
    this.description,
    this.child,
    this.images = const []
  });

  final String asset;
  final String name;
  final Widget child;
  final List<String> images;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(asset, fit: BoxFit.contain)
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => Provider.of<HomeProvider>(context,listen: false).show(
                        PortfolioDialog(
                          name: name,
                          asset: asset,
                          child: child,
                          images: images,
                          description: description,
                        )
                      ),
                    ),
                  ), 
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(name, style: TextStyle(fontSize: 18)),
          ),
        ]
      ),
    );
  }
}