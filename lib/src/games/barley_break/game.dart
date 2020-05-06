import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<BarleyBreakProvider>(
      builder: (context, value, child) {
        return value.success
        ? Text('You win!')
        : Column(
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
                          border: Border.all(color: el == 0 ? Colors.transparent : Colors.black),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Text(el == 0 ? '' : '$el'),
                      ),
                      onTap: () => Provider.of<BarleyBreakProvider>(context, listen: false).move(matrixIndex, index, el),
                    )
                  )
                ).values.toList()
              )
            ) 
          ).values.toList()
        );
      }
    );
  }
}