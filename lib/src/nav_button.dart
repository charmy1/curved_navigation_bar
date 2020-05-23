import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;
  final List<String> titles;

  NavButton(
      {this.onTap,
      this.position,
      this.length,
      this.index,
      this.child,
      this.titles});

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                    height: 75.0,
                    child: Transform.translate(
                      offset: Offset(
                          0,
                          difference < 1.0 / length
                              ? verticalAlignment * 40
                              : 0),
                      child: Opacity(
                          opacity:
                              difference < 1.0 / length * 0.99 ? opacity : 1.0,
                          child: child),
                    )),
              ),
              Visibility(
                  //  opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                  visible: (difference < 1.0 / length * 0.99),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      titles[index],
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
