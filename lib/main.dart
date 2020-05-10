import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider()..init(),
        ),
        ChangeNotifierProvider<BarleyBreakProvider>(
          create: (context) => BarleyBreakProvider()..init(),
        ),
        ChangeNotifierProvider<G2048Provider>(
          create: (context) => G2048Provider(),
        ),
      ],
      child: MaterialApp(
        title: 'Arthur Khabirov',
        theme: ThemeData(
          fontFamily: 'UnicaOne'
        ),
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget child) {
          return ScrollConfiguration(
            behavior: PortfolioOverScrollBehavior(),
            child: child
          );
        },
        home: HomeScreen(),
      )
    );
  }
}