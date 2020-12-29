import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'left_side_head.dart';
import 'left_side_list.dart';
import 'left_side_bottom.dart';

class LeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 182,
        child: Container(
            color: Color.fromRGBO(21, 56, 114, 1),
            child: Column(
              children: [
                WindowTitleBarBox(child: MoveWindow()),
                Expanded(child: Column(
                  children: [
                    LeftSideHead(),
                    LeftSideList(),
                  ],
                )),
                LeftSideBottom(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 5,right: 5),
                    color: Color.fromRGBO(220, 220, 220, 0.2),
                    child: Text("广告",style: TextStyle(color: Color(0xffc1dcf6),fontSize: 10),),
                  ),
                )
              ],
            )
        )
    );
  }
}
