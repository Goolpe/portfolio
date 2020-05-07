import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class BarleyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String _durationToTimer(Duration duration) {
      String twoDigits(int n) => 
        n >= 10 ? '$n' : '0$n';

      final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).toInt());
      final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).toInt());
      return '$twoDigitMinutes:$twoDigitSeconds';
    }

    Future<bool> _onPop(){
      Provider.of<BarleyBreakProvider>(context, listen: false).pause();
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        body: Consumer<BarleyBreakProvider>(
          builder: (context, value, child) {
            return value.success
              ? Text('You won!\n${_durationToTimer(Duration(seconds: value.counter))}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center
              )
              : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('${_durationToTimer(Duration(seconds: value.counter))}', 
                      style: TextStyle(fontSize: 20)
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: value.matrixList.asMap().map((int matrixIndex, List<int> matrixEl) => 
                    MapEntry(matrixIndex, 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: matrixEl.asMap().map((int index, int el) =>
                          MapEntry(index, 
                            GestureDetector(
                              child: Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: value.colorList[el],
                                  borderRadius: BorderRadius.circular(16)
                                ),
                                child: Text(el == 0 ? '' : '$el', 
                                  style: TextStyle(
                                    color: Colors.white, 
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                  )
                                ),
                              ),
                              onTap: () => Provider.of<BarleyBreakProvider>(context, listen: false)
                                .move(matrixIndex, index, el),
                            )
                          )
                        ).values.toList()
                      )
                    ) 
                  ).values.toList()
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text(Provider.of<BarleyBreakProvider>(context,listen: false).manageText(), 
                            style: TextStyle(fontSize: 18)
                          ),
                          elevation: 0,
                          onPressed: () => Provider.of<BarleyBreakProvider>(context,listen: false).manage(),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                          child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          color: Colors.blueGrey,
                          textColor: Colors.white,
                          child: Text('reset',style: TextStyle(fontSize: 18)),
                          elevation: 0,
                          onPressed: () => Provider.of<BarleyBreakProvider>(context,listen: false).init(),
                        ),
                      )
                    ]
                  ),
                ),
              ]
            );
          }
        ),
      )
    );
  }
}