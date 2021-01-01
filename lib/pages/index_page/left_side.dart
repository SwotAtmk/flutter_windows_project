import 'package:flutter/material.dart';
import '../pages_register.dart' show LeftSideHead,LeftSideBottom,LeftSideList;

class LeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 182,
        child: Container(
            color: Color(0xff153872),
            child: Column(
              children: [
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
