import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BarleyBreakProvider>(
          create: (context) => BarleyBreakProvider()..init(),
        ),
        ChangeNotifierProvider<G2048Provider>(
          create: (context) => G2048Provider(),
        )
      ],
      child: GetMaterialApp(
        title: 'Goolpe',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      )
    );
  }
}