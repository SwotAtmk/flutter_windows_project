import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'index_page/left_side.dart';
import 'index_page/right_side.dart';

// ignore: must_be_immutable
class IndexPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WindowBorder(
            color: Color.fromRGBO(0, 0, 0, 0),
            width: 0,
            child: Row(
                children: [
                  LeftSide(),
                  RightSide()
                ]
            )
        )
    );
  }
}

