import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'window_buttons.dart';
import 'window_title.dart';


class RightSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(color: Colors.white70),
            child: Column(
                children: [
                  SizedBox(
                    height: 48,
                    child: Row(
                        children: [
                          Expanded(child:
                            MoveWindow(child:
                              WindowTitle(),
                            )
                          ),
                          WindowButtons()
                        ]),
                  )
                ])
        )
    );
  }
}