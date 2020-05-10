import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return Scaffold(
      body: ListView(
        children: <Widget>[
          WelcomeScreen(animation: _animation),
          PortfolioScreen(),
          AboutScreen(),
        ],
      ),
    );
  }
}