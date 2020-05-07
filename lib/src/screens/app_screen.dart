import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';

class AppScreen extends StatefulWidget {
  AppScreen({
    @required this.name,
    @required this.asset,
    this.child,
    this.images = const []
  });

  final String name;
  final String asset;
  final Widget child;
  final List<String> images;

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return PortfolioDialog(
      name: widget.name,
      asset: widget.asset,
      child: widget.child != null
      ? widget.child
      : Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 400.0,
            ),
            items: widget.images.map((String image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.center,
                    child: Image.asset(image, fit: BoxFit.cover)
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
      ),
    );
  }
}