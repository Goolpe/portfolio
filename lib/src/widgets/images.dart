import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';

class PortfolioImages extends StatefulWidget {
  PortfolioImages({
    this.images = const []
  });

  final List<String> images;

  @override
  _PortfolioImagesState createState() => _PortfolioImagesState();
}

class _PortfolioImagesState extends State<PortfolioImages> {
  
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
      ? ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        children: widget.images.map((String image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Image.network(URL_ASSET + image, fit: BoxFit.cover)
              );
            },
          );
        }).toList(),
      )
      : ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 400,
                viewportFraction: 1,
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
        )
    );
  }
}