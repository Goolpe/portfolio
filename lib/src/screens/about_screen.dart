import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/index.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _portrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return _portrait
      ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: _children(_portrait)
        ),
      )
      : Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ..._children(_portrait),
            _footer()
          ]
        )
    );
  }

  List<Widget> _children(bool portrait){
    return <Widget>[
      Text('About me'.toUpperCase(), textAlign: TextAlign.center, style: TextStyle(fontSize: portrait ? 20 : 40)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text('Hi, I\'m Arthur.\n'.toUpperCase(), 
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
          ),
          Container(
            child: Text('Passionate Mobile & Web Developer with 2 years professional experience.\n'
                'I finished Ufa State Petroleum University '
                'with Bachelor of Applied Informatics.\n'
                'Primarily programming in Dart (Flutter), Java, Kotlin, Javascript (React)\n\n'
                'I’m native Russian speaker with intermediate English and basic knowledge of German. '
                'Currently live in Saint-Petersburg, Russia.\n'
                'If you have any questions or would like to further discuss my qualifications, '
                'please don\'t hesitate to contact me.',
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PortfolioSocialButton(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  link: 'https://docs.google.com/document/d/1EerYQ8yHMnfGubLpffNUxlIUeYc71nFR2f4HPdECB4E/edit?usp=sharing',
                  icon: MdiIcons.fileDocument,
                  title: 'Get My Resume',
                ),
                PortfolioSocialButton(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  link: 'https://github.com/Goolpe',
                  icon: MdiIcons.github,
                  title: 'Github',
                ),
                PortfolioSocialButton(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  link: 'https://www.linkedin.com/in/goolpe',
                  icon: MdiIcons.linkedin,
                  title: 'LinkedIn',
                ),
                PortfolioSocialButton(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  link: 'https://t.me/goolpe_t',
                  icon: MdiIcons.telegram,
                  title: 'Telegram',
                ),
              ],
            ),
          ),
        ]
      ),
      if(portrait)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: _footer()
        )
    ];
  }

  Widget _footer(){
    final _date = DateTime.now().year;
    return Text('$_date | Created using Flutter'.toUpperCase());
  }
}