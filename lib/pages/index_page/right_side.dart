import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'window_buttons.dart';
import 'window_title.dart';
import '../paper_check_page.dart';

class RightSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(color: Colors.white70),
            child: Column(children: [
              SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onPanStart: (details) {
                          dragAppWindow();
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: WindowTitle()
                              )
                            ]
                        )
                      )
                    ),
                    WindowButtons(),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 30,top: 20),
                decoration: BoxDecoration(
                    color: Color(0xfff6f9f9) ///Color(0xfff6f9f9)
                ),
                alignment: Alignment.centerLeft,
                child: Text("文章查重",style: TextStyle(fontSize: 18),),
              ),
              Expanded(child:
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff6f9f9) ///Color(0xfff6f9f9)
                  ),
                  child: PaperCheckPage()
                )
              )
            ])
        )
    );
  }
}