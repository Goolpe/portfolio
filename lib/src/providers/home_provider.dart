import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';

class HomeProvider with ChangeNotifier{
 
  final List<PortfolioDetails> cards = [
    PortfolioDetails(
      id: 0,
      name: 'Nevoffice', 
      images: [
        'nevoffice/0.jpg',
        'nevoffice/1.jpg',
        'nevoffice/2.jpg',
        'nevoffice/3.jpg',
        'nevoffice/4.jpg',
        'nevoffice/5.jpg',
      ],
      logo: 'nevoffice/logo.jpg',
      description:  'Android application allowing to record, save in SQLite '
                    'and upload to the server throw GraphQL: locations, ' 
                    'logs (battery, errors, memory, connection, headphone and gps status), '
                    'photo and video in background/foreground.\n\n'
                    'Convenient management tools: report, task page, yandex map '
                    'containing polylines, polygons and points with description '
                    'of the task, settings, file upload button.\n\n'
                    'State management: Provider\n'
                    'Framework / Language: Flutter / Dart,Java,Kotlin',
      googlePlayLink: 'https://play.google.com/store/apps/details?id=ru.adsdesign.nevofise',
      backgroundColor: Colors.green
    ),
    PortfolioDetails(
      id: 1,
      name: 'Rostock', 
      images: [
        'sprout/0.jpg',
        'sprout/1.jpg',
        'sprout/2.jpg',
        'sprout/3.jpg',
        'sprout/4.jpg',
        'sprout/5.jpg',
      ],
      logo: 'sprout/logo.jpg',
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
      googlePlayLink: 'https://play.google.com/store/apps/details?id=ru.adsdesign.rostock_customer',
      appStoreLink: 'https://apps.apple.com/ru/app/%D1%80%D0%BE%D1%81%D1%82%D0%BE%D0%BA-%D1%80%D0%B0%D1%81%D0%BF%D1%80%D0%BE%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5-%D1%80%D0%B5%D0%BA%D0%BB%D0%B0%D0%BC%D1%8B/id1473246473',
      backgroundColor: Colors.blue
    ),
    PortfolioDetails(
      id: 2,
      name: 'Rostock Promoter', 
      images: [
        'sprout_prom/0.jpg',
        'sprout_prom/1.jpg',
        'sprout_prom/2.jpg',
        'sprout_prom/3.jpg',
      ],
      logo: 'sprout_prom/logo.jpg',
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
      googlePlayLink: 'https://play.google.com/store/apps/details?id=ru.adsdesign.rostock_promoter',
      appStoreLink: 'https://apps.apple.com/ru/app/%D1%80%D0%BE%D1%81%D1%82%D0%BE%D0%BA-%D0%BF%D1%80%D0%BE%D0%BC%D0%BE%D1%83%D1%82%D0%B5%D1%80/id1479981854',
      backgroundColor: Colors.teal
    ),
    PortfolioDetails(
      id: 3,
      name: 'Bikes',
      images: [
        'bikes/0.jpg',
        'bikes/1.jpg',
        'bikes/2.jpg',
      ],
      description: 'Demo application. List of bikes parsed from json. '
                    'Ability to remove items and add new.\n\n'
                    '• ListView with items that contain: Bike Photo, Name, Category, Frame Size and Location.\n'
                    '• Detail page with all available information for each item.\n'
                    '• Edit page where you can edit or add new items.\n\n'
                    'State management: Provider\n'
                    'Framework / Language: Flutter / Dart',
      githubLink: 'https://github.com/Goolpe/bikes',
      backgroundColor: Colors.cyan
    ),
  ];

  PortfolioDetails _screen;
  PortfolioDetails get screen => _screen;

  void init(){
    _screen = cards[0];
    notifyListeners();
  }

  void show(PortfolioDetails card){
    _screen = card;
    notifyListeners();
  }
}