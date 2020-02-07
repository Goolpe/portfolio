import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ScrollState extends Equatable{
  const ScrollState(this.scrollController);

  final ScrollController scrollController;
  
  @override
  List<ScrollController> get props => <ScrollController>[scrollController];
}

class ScrollInitialize extends ScrollState{
  ScrollInitialize(ScrollController scrollController):super(scrollController);
}

class ScrollUninitialize extends ScrollState{
  ScrollUninitialize():super(null);
}

class ScrollHide extends ScrollState{
  ScrollHide(ScrollController scrollController):super(scrollController);
}

class ScrollShow extends ScrollState{
  ScrollShow(ScrollController scrollController):super(scrollController);
}