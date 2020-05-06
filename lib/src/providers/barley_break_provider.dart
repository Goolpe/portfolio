import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class BarleyBreakProvider with ChangeNotifier{
  final List<int> initList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0];

  List<int> _list = [];
  List<int> get list => _list;

  List<List<int>> _matrixList = [[]];
  List<List<int>> get matrixList => _matrixList;

  bool _success = false;
  bool get success => _success;
  
  void init(){
    _list = List.from(initList);
    _createMatrix();
  }

  void _createMatrix(){
    _success = false;
    _matrixList = [[]];
    for(int i = 0, mI = 0; i < list.length; i++){
      if(matrixList[mI].length == 4){
        matrixList.add([]);
        mI++;
      }
      matrixList[mI].add(list[i]);
    }
    notifyListeners();
  }
  
  void start(){
    _list.shuffle();
    _createMatrix();
  }

  void move(
    int matrixIndex,
    int index, 
    int el
  ){
    if(el != 0){
      int listIndex = index + matrixIndex*4;
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
    if(listEquals(_list,initList)){
      _finish();
    }
  }

  void _finish(){
    _success = true;
    notifyListeners();
  }
}