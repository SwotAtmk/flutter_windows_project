import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:bitsdojo_window/bitsdojo_window.dart';

class WindowTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 18),
            child: ClipOval(
              child: Container(  // TODO: 可以是头像，先用Container占位，后期替换为头像
                width: 20,
                height: 20,
                color: Colors.black12,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Text("卡密：123456******",style: TextStyle(color: Colors.black54,fontSize: 12),), // TODO:暂时填入默认值，后面从状态管理中获取
          )
        ],
    );
  }
}
