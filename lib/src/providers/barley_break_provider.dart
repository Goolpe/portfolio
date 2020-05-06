import 'package:flutter/cupertino.dart';

class BarleyBreakProvider with ChangeNotifier{
  List<int> _list = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0];
  List<int> get list => _list;

  List<List<int>> _matrixList = [[]];
  List<List<int>> get matrixList => _matrixList;
  
  void init(){
    for(int i = 0, mI = 0; i < list.length; i++){
      if(matrixList[mI].length == 4){
        matrixList.add([]);
        mI++;
      }
      matrixList[mI].add(list[i]);
    }
    notifyListeners();
  }
  
  void move(
    int matrixIndex,
    int index, 
    int el
  ){
    if(el != 0){
      int listIndex = index + matrixIndex*4;
      if(listIndex > 0){
        _update(listIndex, -1, el);
      }
      if(listIndex > 3){
        _update(listIndex, -4, el);
      }
      if(listIndex < 15){
        _update(listIndex, 1, el);
      }
      if(listIndex < 12){
        _update(listIndex, 4, el);
      }
    }
  }

  void _update(int index, int newIndex, int el){
    if(list[index + newIndex] == 0){
      list[index + newIndex] = el;
      list[index] = 0;
      init();
    }
    return;
  }
}