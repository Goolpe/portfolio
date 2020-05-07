import 'package:flutter/cupertino.dart';
import 'package:portfolio/index.dart';

class HomeProvider with ChangeNotifier{
 
  final List<PortfolioCard> cardsStore = [
    PortfolioCard(
      asset: 'assets/nevoffice/nevoffice.webp', 
      name: 'Не в офисе\n[Out of office]', 
      images: [
        'assets/nevoffice/screenshot_0.png',
        'assets/nevoffice/screenshot_1.png',
        'assets/nevoffice/screenshot_2.png',
        'assets/nevoffice/screenshot_3.png',
        'assets/nevoffice/screenshot_4.png',
        'assets/nevoffice/screenshot_5.png',
      ],
    ),
    PortfolioCard(
      asset: 'assets/sprout/sprout.webp', 
      name: 'Росток\n[Sprout]', 
      images: [
        'assets/sprout/screenshot_0.webp',
        'assets/sprout/screenshot_1.webp',
        'assets/sprout/screenshot_2.webp',
        'assets/sprout/screenshot_3.webp',
        'assets/sprout/screenshot_4.webp',
        'assets/sprout/screenshot_5.webp',
      ],
    ),
    PortfolioCard(
      asset: 'assets/sprout_prom/sprout_prom.webp', 
      name: 'Росток Пром.\n[Sprout Promoter]', 
      images: [
        'assets/sprout_prom/screenshot_0.webp',
        'assets/sprout_prom/screenshot_1.webp',
        'assets/sprout_prom/screenshot_2.webp',
        'assets/sprout_prom/screenshot_3.webp',
      ],
    )
  ];

  final List<PortfolioCard> cardsOther = [
    PortfolioCard(
      asset: 'assets/bikes/bike.png', 
      name: 'Bikes',
      images: [
        'assets/bikes/0.png',
        'assets/bikes/1.png',
        'assets/bikes/2.png',
      ],
    ),
    PortfolioCard(
      asset: 'assets/barley_break.png', 
      name: 'Barley Break', 
      child: BarleyScreen()
    ),
    PortfolioCard(
      asset: 'assets/rr/logo.jpg', 
      name: 'Random Rules',
      images: [
        'assets/rr/screenshot_0.png',
        'assets/rr/screenshot_1.png',
        'assets/rr/screenshot_2.png',
      ],
    ),
  ];

  AppScreen _screen;
  AppScreen get screen => _screen;

  void show(AppScreen el){
    _screen = el;
    notifyListeners();
  }
}