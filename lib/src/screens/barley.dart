import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class BarleyScreen extends StatelessWidget {
  const BarleyScreen();
  
  @override
  Widget build(BuildContext context) {
    String _durationToTimer(Duration duration) {
      String twoDigits(int n) => 
        n >= 10 ? '$n' : '0$n';

      final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).toInt());
      final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).toInt());
      return '$twoDigitMinutes:$twoDigitSeconds';
    }

    return Container(
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Consumer<BarleyBreakProvider>(
        builder: (context, BarleyBreakProvider value, child) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                value.success
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('You won!\n${_durationToTimer(Duration(seconds: value.counter))}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.center
                  ),
                )
                : Column(
                  children: [
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
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: value.colorList[el],
                                    borderRadius: BorderRadius.circular(8)
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
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      width: 80,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(Provider.of<BarleyBreakProvider>(context,listen: false).manageText()),
                        elevation: 0,
                        onPressed: () => Provider.of<BarleyBreakProvider>(context,listen: false).manage(),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 80,
                        child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                        child: Text('reset'),
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
    );
  }
}