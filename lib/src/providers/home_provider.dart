import 'package:flutter/cupertino.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

enum CardType{
  commercial,
  others
}

class HomeProvider with ChangeNotifier{
 
  final List<PortfolioDetails> cards = [
    PortfolioDetails(
      id: 0,
      asset: 'nevoffice/nevoffice.webp', 
      name: 'Не в офисе\n[Nevoffice]', 
      images: [
        'nevoffice/screenshot_0.png',
        'nevoffice/screenshot_1.png',
        'nevoffice/screenshot_2.png',
        'nevoffice/screenshot_3.png',
        'nevoffice/screenshot_4.png',
        'nevoffice/screenshot_5.png',
      ],
      description:  'Android application allowing to record, save in SQLite '
                    'and upload to the server throw GraphQL: locations, ' 
                    'logs (battery, errors, memory, connection, headphone and gps status), '
                    'photo and video in background/foreground.\n\n'
                    'Convenient management tools: report, task page, yandex map '
                    'containing polylines, polygons and points with description '
                    'of the task, settings, file upload button.\n\n'
                    'State management: Provider\n'
                    'Framework / Language: Flutter / Dart,Java,Kotlin',
      googlePlayLink: "https://play.google.com/store/apps/details?id=ru.adsdesign.nevofise",
      cardType: CardType.commercial
    ),
    PortfolioDetails(
      id: 1,
      asset: 'sprout/sprout.webp', 
      name: 'Росток [Rostock]', 
      images: [
        'sprout/screenshot_0.webp',
        'sprout/screenshot_1.webp',
        'sprout/screenshot_2.webp',
        'sprout/screenshot_3.webp',
        'sprout/screenshot_4.webp',
        'sprout/screenshot_5.webp',
      ],
      description:  'Application for Android and iOS, that allow '
                    'to create tasks for promoters and track them.\n\n'
                    'Convenient tools for creating and managing: '
                    'create page, yandex map '
                    'containing polylines, polygons and points with description of the task, '
                    'list of available tasks, promoters and map data,'
                    'ability to watch video and photo of the task and change the status, '
                    'chat with promoters and managers throw WebSockets.\n\n'
                    'State management: Bloc\n'
                    'Framework / Language: Flutter / Dart,Java,Swift',
      googlePlayLink: "https://play.google.com/store/apps/details?id=ru.adsdesign.rostock_customer",
      appStoreLink: 'https://apps.apple.com/ru/app/%D1%80%D0%BE%D1%81%D1%82%D0%BE%D0%BA-%D1%80%D0%B0%D1%81%D0%BF%D1%80%D0%BE%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5-%D1%80%D0%B5%D0%BA%D0%BB%D0%B0%D0%BC%D1%8B/id1473246473',
      cardType: CardType.commercial
    ),
    PortfolioDetails(
      id: 2,
      asset: 'sprout_prom/sprout_prom.webp', 
      name: 'Росток Пром.\n[Rostock Promoter]', 
      images: [
        'sprout_prom/screenshot_0.webp',
        'sprout_prom/screenshot_1.webp',
        'sprout_prom/screenshot_2.webp',
        'sprout_prom/screenshot_3.webp',
      ],
      description: 'Previous version of Nevoffice application for Android and iOS, that allow '
                    'to record, save in SQLite '
                    'and upload to the server throw GraphQL - locations, ' 
                    'logs (battery, errors, memory, connection and gps status), '
                    'photo and video in background.\n\n'
                    'Convenient management tools: report, chat with client (WebSockets), task page, yandex map '
                    'containing polylines, polygons and points with description '
                    'of the task, settings, file upload button.\n\n'
                    'State management: Bloc\n'
                    'Framework / Language: Flutter / Dart,Java,Swift',
      googlePlayLink: "https://play.google.com/store/apps/details?id=ru.adsdesign.rostock_promoter",
      appStoreLink: 'https://apps.apple.com/ru/app/%D1%80%D0%BE%D1%81%D1%82%D0%BE%D0%BA-%D0%BF%D1%80%D0%BE%D0%BC%D0%BE%D1%83%D1%82%D0%B5%D1%80/id1479981854',
      cardType: CardType.commercial
    ),
    PortfolioDetails(
      id: 3,
      asset: 'bikes/bike.png', 
      name: 'Bikes',
      images: [
        'bikes/0.png',
        'bikes/1.png',
        'bikes/2.png',
      ],
      description: 'Demo application. List of bikes parsed from json. '
                    'Ability to remove items and add new.\n\n'
                    '• ListView with items that contain: Bike Photo, Name, Category, Frame Size and Location.\n'
                    '• Detail page with all available information for each item.\n'
                    '• Edit page where you can edit or add new items.\n\n'
                    'State management: Provider\n'
                    'Framework / Language: Flutter / Dart',
      githubLink: 'https://github.com/Goolpe/bikes',
      cardType: CardType.others
    ),
    PortfolioDetails(
      id: 4,
      asset: 'barley_break.png', 
      name: 'Barley Break', 
      child: BarleyScreen(),
      description:  'Demo game application.\n\n'
                    'State management: Provider\n'
                    'Framework / Language: Flutter / Dart',
      githubLink: 'https://github.com/Goolpe/portfolio/blob/master/lib/src/screens/barley.dart',
      cardType: CardType.others
    ),
  ];

  PortfolioDetails _screen;
  PortfolioDetails get screen => _screen;

  void init(){
    _screen = cards[0];
    notifyListeners();
  }

  void show(PortfolioDetails card, BuildContext context){
    Provider.of<BarleyBreakProvider>(context,listen: false).pause();
    _screen = card;
    notifyListeners();
  }
}