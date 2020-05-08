import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:url_launcher/url_launcher.dart';

enum LinkType{
  googlePlay,
  appStore,
  github
}

class PortfolioDetails extends StatefulWidget {
  PortfolioDetails({
    this.id,
    this.child,
    @required this.name,
    @required this.logo,
    this.images,
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
  _PortfolioDetailsState createState() => _PortfolioDetailsState();
}

class _PortfolioDetailsState extends State<PortfolioDetails> {

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: MediaQuery.of(context).orientation == Orientation.landscape
      ? 600 : 225,
      child: MediaQuery.of(context).orientation == Orientation.landscape
      ? Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _card(),
          Expanded(
            child: _description(),
          )
        ]
      )
      : ListView(
        shrinkWrap: true,
        children: <Widget>[
          _card(),
          _description(),
        ]
      )
    );
  }

  Widget _card(){
    return Container(
      height: 400,
      width: 225,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(
          color: Color(0xFF000000).withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 6
        )]
      ),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _child(),
      )
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
                child: Image.network(URL_ASSET + widget.logo, 
                  fit: BoxFit.contain,
                  height: 60,
                  width: 60,
                )
              ),
              SizedBox(width: 10),
              Text(widget.name,
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
              _socialButton(widget.googlePlayLink, LinkType.googlePlay),
              SizedBox(width: 16),
              _socialButton(widget.appStoreLink, LinkType.appStore),
            ],
          ),
          if(widget.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(widget.description),
            ),
          if(widget.githubLink != null)
            Row(
              children: <Widget>[
                Text('Code is available on '),
                _socialButton(widget.githubLink, LinkType.github),
              ],
            ),
        ],
      ),
    );
  }

  Widget _child(){
    return widget.child != null
    ? widget.child
    : Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 400.0,
            viewportFraction: 1
          ),
          items: widget.images.map((String image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: Image.network(URL_ASSET + image, fit: BoxFit.cover)
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: SizedBox(
                width: 40,
                child: Icon(Icons.chevron_left),
              ),
              onTap: () => _carouselController.previousPage()
            )
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: SizedBox(
                width: 40,
                child: Icon(Icons.chevron_right),
              ),
              onTap: () => _carouselController.nextPage(),
            )
          ),
        ),
      ],
    );
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