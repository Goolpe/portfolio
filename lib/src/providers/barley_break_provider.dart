import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum BarleyStatus{
  stopped,
  running,
  paused
}

class BarleyBreakProvider with ChangeNotifier{
  final List<int> initList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0];
  final List<Color> colorList = [
    Colors.transparent, 
    Colors.amber, 
    Colors.blue, 
    Colors.cyan, 
    Colors.deepOrange, 
    Colors.indigo, 
    Colors.green, 
    Colors.lime, 
    Colors.orange, 
    Colors.pink, 
    Colors.purple, 
    Colors.teal, 
    Colors.redAccent, 
    Colors.grey,
    Colors.blueGrey, 
    Colors.black, 
  ];

  List<int> _list = [];
  List<int> get list => _list;

  List<List<int>> _matrixList = [[]];
  List<List<int>> get matrixList => _matrixList;

  bool _success = false;
  bool get success => _success;

  BarleyStatus _barleyStatus = BarleyStatus.stopped;
  BarleyStatus get barleyStatus => _barleyStatus;

  int _counter = 0;
  int get counter => _counter;

  Timer _timer;
  
  void init(){
    _barleyStatus = BarleyStatus.stopped;
    _timer?.cancel();
    _list = List.from(initList);
    _createMatrix();
  }

  void _createMatrix(){
    _counter = 0;
    _success = false;
    _matrixList = [[]];
    for(var i = 0, mI = 0; i < list.length; i++){
      if(matrixList[mI].length == 4){
        matrixList.add([]);
        mI++;
      }
      matrixList[mI].add(list[i]);
    }
    notifyListeners();
  }
  
  void manage(){
    switch(_barleyStatus){
      case BarleyStatus.running: pause(); break;
      case BarleyStatus.paused: _resume(); break;
      case BarleyStatus.stopped: 
        _list.shuffle();
        _resume();
        _createMatrix(); 
        break;
    }
  }

  void _resume(){
    _barleyStatus = BarleyStatus.running;
    notifyListeners();
    _timer = Timer.periodic(Duration(seconds: 1), (_){
      _counter++;
      notifyListeners();
    });
  }

  void move(
    int matrixIndex,
    int index, 
    int el
  ){
    if(el != 0 && _barleyStatus == BarleyStatus.running){
      var listIndex = index + matrixIndex*4;
      if(listIndex > 0){
        _update(matrixIndex, index, listIndex, -1, el);
      }
      if(listIndex > 3){
        _update(matrixIndex, index, listIndex, -4, el);
      }
      if(listIndex < 15){
        _update(matrixIndex, index, listIndex, 1, el);
      }
      if(listIndex < 12){
        _update(matrixIndex, index, listIndex, 4, el);
      }
    }
  }

  void _update(int matrixIndex, int index, int listIndex, int newIndex, int el){
    if(list[listIndex + newIndex] == 0){
      _list[listIndex + newIndex] = el;
      _list[listIndex] = 0;
       _updateMatrix(matrixIndex, index, newIndex, el);
      _check();
      notifyListeners();
    }
    return;
  }

  void _updateMatrix(int matrixIndex, int index, int newIndex, int el){
    switch(newIndex){
      case -1: _matrixList[matrixIndex][index - 1] = el; break;
      case 1: _matrixList[matrixIndex][index + 1] = el; break;
      case -4: _matrixList[matrixIndex - 1][index] = el; break;
      case 4: _matrixList[matrixIndex + 1][index] = el; break;
    }
    _matrixList[matrixIndex][index] = 0;
  }

  void _check(){
    if(_barleyStatus == BarleyStatus.running && listEquals(_list,initList)){
      _finish();
    }
  }

  void pause(){
    if(_barleyStatus == BarleyStatus.running){
      _barleyStatus = BarleyStatus.paused;
      _timer?.cancel();
      notifyListeners();
    }
  }
  
  void _finish(){
    _success = true;
    _barleyStatus = BarleyStatus.stopped;
    _timer?.cancel();
    notifyListeners();
  }

  String manageText(){
    switch(_barleyStatus){
      case BarleyStatus.paused: return 'resume';
      case BarleyStatus.stopped: return 'start';
      case BarleyStatus.running: return 'pause';
      default: return 'start';
    }
  }
}