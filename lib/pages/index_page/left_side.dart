import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'left_side_head.dart';

class LeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: Container(
            color: Color.fromRGBO(21, 56, 114, 1),
            child: Column(
              children: [
                WindowTitleBarBox(child: MoveWindow()),
                Expanded(child: Column(
                  children: [
                    LeftSideHead(),
                    // list
                    // bottom
                  ],
                ))
              ],
            )
        )
    );
  }
}
