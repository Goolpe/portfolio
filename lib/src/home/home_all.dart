import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/shelf.dart';

class HomeAllScreen extends StatelessWidget{
  final List<Widget> screens = <Widget>[HomeScreen(), AboutScreen(), AboutScreen()];
  final List<String> titles = ['Home','About','Experience','Portfolio','Contact'];
  final List<String> images = ['http://cvresumetemplate.com/maha-personal-cv-resume-html-template/assets/images/home-bg-img.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ScrollBloc>(
        create: (BuildContext context) => ScrollBloc()..add(ScrollStarted(context)),
        child: BlocBuilder<ScrollBloc, ScrollState>(
          builder: (context, state) {
            return Stack(
              children: <Widget>[
                ListView.builder(
                  controller: state.scrollController,
                  physics: PageScrollPhysics(),
                  itemCount: screens.length,
                  itemBuilder: (_, i) => 
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          i == 0
                          ? Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(images[0]),
                                fit: BoxFit.cover,
                              )
                            )
                          )
                          : const SizedBox(),
                          i == 0
                          ? Container(
                            color: Colors.white.withOpacity(0.9),
                          )
                          : const SizedBox(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 200),
                            child: screens[i],
                          )
                        ]
                      )
                    ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: 80,
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 100),
                //     child: Row(
                //       children: <Widget>[
                //         Expanded(
                //           flex: 3,
                //           child: Text('lol'),
                //         ),
                //         Expanded(
                //           flex: 7,
                //           child: Row(
                //             children: titles.asMap().map((int i, String s) => 
                //               MapEntry(i,
                //                 FlatButton(
                //                   child: Text(s, style: Theme.of(context).textTheme.headline6),
                //                   onPressed: () => _scrollTo(context, i, state.scrollController)
                //                 )
                //               )
                //             ).values.toList()
                //           ),
                //         )
                //       ],
                //     )
                //   ),
                // ),
              ]
            );
          }
        )
      ),
    );
  }

  _scrollTo(BuildContext context, int i, ScrollController controller){
    controller.animateTo(
      MediaQuery.of(context).size.height * i, 
      duration: Duration(seconds: 1), 
      curve: Curves.fastOutSlowIn
    );
  }
}