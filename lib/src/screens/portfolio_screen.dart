import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool _portrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Consumer<HomeProvider>(
      builder: (context, HomeProvider value, _) {
        return _portrait
        ? Container(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Portfolio'.toUpperCase(), style: TextStyle(fontSize: 20)),
                  Text('here are some works i am proud of', style: TextStyle(fontSize: 14),)
                ],
              ),
              Container(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _appNames(value, context)
                ),
              ),
              Container(
                height: 300,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  scrollDirection: Axis.horizontal,
                  children: value.screen.images.map((String image) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                      child: Image.network(URL_ASSET + image),
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(value.screen.name.toUpperCase(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(value.screen.description, style: TextStyle(fontFamily: 'Monda'),),
                    ),
                    PortfolioSocialButton(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      link: value.screen.googlePlayLink, 
                      icon: MdiIcons.googlePlay, 
                      title: 'google play'),
                    PortfolioSocialButton(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      link: value.screen.appStoreLink, 
                      icon: MdiIcons.apple,
                      title: 'app store'),
                    PortfolioSocialButton(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      link: value.screen.githubLink, 
                      icon: MdiIcons.github, 
                      title: 'github'),
                  ],
                ),
              ),
            ],
          ),
        )
        : Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Portfolio'.toUpperCase(), style: TextStyle(fontSize: 40)),
                  Text('here are some works i am proud of', style: TextStyle(fontSize: 20),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _appNames(value, context)
              ),
              Expanded(
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                          scrollDirection: Axis.horizontal,
                          children: value.screen.images.map((String image) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Image.network(URL_ASSET + image),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(value.screen.name.toUpperCase(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  child: Text(value.screen.description, style: TextStyle(fontFamily: 'Monda'),),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                PortfolioSocialButton(
                                  link: value.screen.googlePlayLink, 
                                  icon: MdiIcons.googlePlay, 
                                  title: 'google play'),
                                PortfolioSocialButton(
                                  link: value.screen.appStoreLink, 
                                  icon: MdiIcons.apple,
                                  title: 'app store'),
                                PortfolioSocialButton(
                                  link: value.screen.githubLink, 
                                  icon: MdiIcons.github, 
                                  title: 'github'),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  List<Widget> _appNames(HomeProvider value, BuildContext context){
    return value.cards.map((PortfolioDetails details){
      return GestureDetector(
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 25, 16, 0),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide( 
              color: value.screen == details 
              ? Colors.black : Colors.white)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(details.name.toUpperCase(), style: TextStyle(fontSize: 24)),
          )
        ),
        onTap: () => Provider.of<HomeProvider>(context,listen: false).show(details),
      );
    }).toList();
  }
}