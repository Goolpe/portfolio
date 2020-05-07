import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/index.dart';

class PortfolioCard extends StatelessWidget {
  PortfolioCard({
    @required this.asset,
    @required this.name,
    this.child
  });

  final String asset;
  final String name;
  final Widget child;

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(asset, fit: BoxFit.cover)
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => Get.dialog(
                        AppScreen(
                          name: name,
                          asset: asset,
                          child: child
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