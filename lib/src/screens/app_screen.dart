import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';

class AppScreen extends StatefulWidget {
  AppScreen({
    @required this.name,
    @required this.asset,
    this.child
  });

  final String name;
  final String asset;
  final Widget child;

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
      : ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1,
              ),
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.amber
                      ),
                      alignment: Alignment.center,
                      child: Text('text $i', style: TextStyle(fontSize: 16.0),)
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
      )
    );
  }
}