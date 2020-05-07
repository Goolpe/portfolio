import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class PortfolioDialog extends StatefulWidget {
  PortfolioDialog({
    @required this.child,
    @required this.name,
    @required this.asset,
    @required this.images,
    this.description = ''
  });

  final Widget child;
  final String name;
  final String asset;
  final String description;
  final List<String> images;

  @override
  _PortfolioDialogState createState() => _PortfolioDialogState();
}

class _PortfolioDialogState extends State<PortfolioDialog> {

  bool _showDetails = false;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              !_showDetails
              ? _hidedContent(context)
              : Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: 300,
                margin: EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 6
                  )]
                ),
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        height: 400,
                        width: 300,
                        child: _child(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(widget.asset, 
                                    fit: BoxFit.contain,
                                    height: 30,
                                    width: 30,
                                  )
                                ),
                                SizedBox(width: 10),
                                Text(widget.name,
                                  style: TextStyle(
                                    fontSize: 18, 
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(widget.description),
                            )
                          ]
                        )
                      ),
                    ]
                  )
                )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: (){
                        Provider.of<BarleyBreakProvider>(context, listen: false).pause();
                        Provider.of<HomeProvider>(context,listen: false).show(null);
                      },
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      margin: EdgeInsets.only(left: 14),
                      color: Colors.black,
                    ),
                    FlatButton(
                      child: Text(_showDetails ? 'Hide details' : 'Details'),
                      onPressed: (){
                        setState(() {
                          _showDetails = !_showDetails;
                        });
                      },
                    )
                  ],
                ),
              ),
            ]
          )
        )
      )
    );
  }

  Widget _hidedContent(context){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(widget.asset, 
                fit: BoxFit.contain,
                height: 50,
                width: 50,
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
        Container(
          height: 400,
          width: 300,
          margin: EdgeInsets.symmetric(vertical: 24),
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
        ),
      ]
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
    );
  }
}