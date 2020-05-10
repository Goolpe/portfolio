import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({
    @required this.animation
  });

  final Animation animation;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _show = false;
  bool _showGame = false;

  @override
  Widget build(BuildContext context) {
    final bool _portrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: FadeTransition(
            opacity: widget.animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _showGame
                ? BarleyScreen()
                : Column(
                  children: <Widget>[
                    Text('Arthur Khabirov'.toUpperCase(), style: TextStyle(fontSize: _portrait ? 30 : 50)),
                    Container(
                      height: 1,
                      width: 100,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text('cross-platform developer', style: TextStyle(fontSize: _portrait ? 14 : 24)),
                    ),
                  ],
                ),
              ],
            )
          ),
        ),
        _portrait
        ? Positioned(
            left: 20,
            top: 20,
            child: _social()
          )
        : Positioned(
          left: 50,
          child: _social()
        ),
        Positioned(
          bottom: 50,
          child: Row(
            children: <Widget>[
              Container(
                height: 20,
                width: 1,
                color: Colors.black,
                margin: EdgeInsets.only(right: 10),
              ),
              Text('SCROLL DOWN', style: TextStyle(fontSize: 16, color: Colors.grey[700]),),
            ],
          ),
        )
      ],
    );
  }

  Widget _social(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _icon(MdiIcons.github, 'https://github.com/Goolpe', 'GITHUB'),
        _icon(MdiIcons.linkedin, 'https://www.linkedin.com/in/goolpe', 'LINKEDIN'),
        _icon(_showGame 
        ? MdiIcons.close 
        : MdiIcons.cubeScan, '', 'TIMEKILLER', 
        onTap: (){
          if(_showGame){
            Provider.of<BarleyBreakProvider>(context,listen: false).pause();
          }
          setState(() => _showGame = !_showGame);
        })
      ],
    );
  }

  Widget _icon(IconData icon, String link, String name, {Function onTap}){
    return InkWell(
      onHover: (hover){
        setState(() {
          _show = hover;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(icon, size: 30), 
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(_show || MediaQuery.of(context).orientation == Orientation.portrait ? name : ''),
            )
          ],
        ),
      ),
      onTap: onTap ?? () async {
        if (await canLaunch(link)) {
          await launch(link);
        }
      },
    );
  }
}