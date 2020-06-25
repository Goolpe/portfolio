import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen();
  
  @override
  Widget build(BuildContext context) {

    return Consumer<HomeProvider>(
      builder: (context, HomeProvider homeState, _) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 50),
                color: Colors.blueGrey,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Text('Portfolio'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 40)),
                    Text('Here are some works i am proud of', style: TextStyle(color: Colors.white, fontSize: 20),)
                  ],
                ),
              ),
              ...homeState.cards.map((details) => Container(
                  color: details.backgroundColor,
                  padding: EdgeInsets.all(50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                if(details.logo != null)
                                  Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Image.asset(details.logo, height: 50)
                                  ),
                                Text(details.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28)),
                              ]
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32),
                              child: Text(details.description, style: TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                            Row(
                              children: _socialButtons(details)
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Image.asset('phone.png', height: 500)
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        );
      }
    );
  }

  List<Widget> _socialButtons(PortfolioDetails details){
    return <Widget>[
      PortfolioSocialButton(
        padding: EdgeInsets.only(right: 8),
        link: details.googlePlayLink,
        icon: MdiIcons.googlePlay, 
        title: 'google play'),
      PortfolioSocialButton(
        padding: EdgeInsets.only(right: 8),
        link: details.appStoreLink,
        icon: MdiIcons.apple,
        title: 'app store'),
      PortfolioSocialButton(
        padding: EdgeInsets.only(right: 8),
        link: details.githubLink,
        icon: MdiIcons.github, 
        title: 'github'),
    ];
  }
}