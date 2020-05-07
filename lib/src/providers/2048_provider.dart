import 'package:flutter/cupertino.dart';

enum G2048Direction {
  horizontal,
  vertical
}

class G2048Provider with ChangeNotifier{
  List<int> _list = [0,0,2,0];
  List<int> get list => _list;

  final double step = 100;

  bool _loading = false;
  bool get loading => _loading;

  double _width = 400;
  double get width => _width;

  double _height = 400;
  double get height => _height;

  double _left = 0;
  double get left => _left;
  
  double _top = 0;
  double get top => _top;

  move(DragUpdateDetails details, G2048Direction direction){
    if(!_loading){
      _loading = true;
      notifyListeners();

      if(direction == G2048Direction.horizontal){
        if (_left == 0 && details.delta.dx > 0) {
          _left = width - step;
          notifyListeners();
        } else if(_left != 0 && details.delta.dx < 0){
          _left = 0;
          notifyListeners();
        }
      } else{
        if (_top == 0 && details.delta.dy > 0) {
          _top = height - step;
          notifyListeners();
        } else if(_top != 0 && details.delta.dy < 0){
          _top = 0;
          notifyListeners();
        }
      }

      Future.delayed(Duration(milliseconds: 300)).then((value){
        _loading = false;
        notifyListeners();
      });

    }
  }
}