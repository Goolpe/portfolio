import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ScrollEvent extends Equatable{
  const ScrollEvent();
  
  @override
  List<Object> get props => <Object>[];
}

class ScrollStarted extends ScrollEvent{
  ScrollStarted(this.context);
  final BuildContext context;
}

class ScrollShowed extends ScrollEvent{}

class ScrollHided extends ScrollEvent{
  ScrollHided(this.offset);
  final double offset;
}