import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:portfolio/shelf.dart';

class ScrollBloc extends Bloc<ScrollEvent, ScrollState> {
  ScrollController _scrollController;

  @override
  ScrollState get initialState => ScrollUninitialize();

  @override
  Future<void> close() {
    _scrollController?.dispose();
    return super.close();
  }
  
  @override
  Stream<ScrollState> mapEventToState(ScrollEvent event) async* {
    if(event is ScrollStarted){
      double offset = 0;
      _scrollController = ScrollController();
      //   ..addListener(() {
      //     double maxScroll = _scrollController.position.maxScrollExtent;
      //     double currentScroll = _scrollController.position.pixels;
      //     double delta = 200.0; // or something else..
      //     if ( maxScroll - currentScroll <= delta) { // whatever you determine here
      //       _scrollController.animateTo(
      //         maxScroll, 
      //         duration: Duration(seconds: 1), 
      //         curve: Curves.fastOutSlowIn
      //       );
      //     }
      // });
      yield ScrollInitialize(_scrollController);
    } else if(event is ScrollHided){
      yield ScrollHide(_scrollController);
    } else if(event is ScrollShowed){
      yield ScrollShow(_scrollController);
    }
  }
}