import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:url_launcher/url_launcher.dart';

enum LinkType{
  googlePlay,
  appStore,
  github
}

class PortfolioDetails extends StatelessWidget {
  PortfolioDetails({
    this.id,
    this.child,
    @required this.name,
    @required this.logo,
    this.images = const [],
    this.description = '',
    this.googlePlayLink,
    this.appStoreLink,
    this.githubLink,
    this.cardType
  });

  final int id;
  final Widget child;
  final String name;
  final String logo;
  final String description;
  final List<String> images;
  final String googlePlayLink;
  final String appStoreLink;
  final String githubLink;
  final CardType cardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: MediaQuery.of(context).orientation == Orientation.landscape
      ? Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: _card(context),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _description(),
            ),
          )
        ]
      )
      : ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          _card(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _description(),
          ),
        ]
      )
    );
  }

  Widget _card(context){
    return Container(
      height: 400,
      width: 225,
      decoration: MediaQuery.of(context).orientation == Orientation.landscape
      ? BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(
          color: Color(0xFF000000).withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 6
        )]
      ) : BoxDecoration(),
      alignment: Alignment.center,
      child:  _child(),
    );
  }

  Widget _description(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(URL_ASSET + logo, 
                  fit: BoxFit.contain,
                  height: 60,
                  width: 60,
                )
              ),
              SizedBox(width: 10),
              Text(name,
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold
                )
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: <Widget>[
              _socialButton(googlePlayLink, LinkType.googlePlay),
              SizedBox(width: 16),
              _socialButton(appStoreLink, LinkType.appStore),
            ],
          ),
          if(description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(description),
            ),
          if(githubLink != null)
            Row(
              children: <Widget>[
                Text('Code is available on '),
                _socialButton(githubLink, LinkType.github),
              ],
            ),
        ],
      ),
    );
  }

  Widget _child(){
    return child != null
    ? ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: child
    )
    : PortfolioImages(images: images);
  }

  Widget _socialButton(String link, LinkType type){
    return link == null
    ? SizedBox()
    : GestureDetector(
      child: Container(
        // width: 150,
        height: 40,
        child: Image.network(URL_ASSET + _logo(type)),
      ),
      onTap: () async {
        if (await canLaunch(link)) {
          await launch(link);
        }
      }
    );
  }

  String _logo(LinkType type){
    switch(type){
      case LinkType.appStore: return 'app_store.png';
      case LinkType.googlePlay: return 'google_play.png';
      case LinkType.github: return 'github.png';
      default: return '';
    }
  }
}