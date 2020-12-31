import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'window_buttons.dart';
import 'window_title.dart';
import '../paper_check_page.dart';
import '../activation_page.dart';

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
              Expanded(child:
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff6f9f9) ///Color(0xfff6f9f9)
                  ),
                  child:  ActivationPage() /// TODO:右侧页面，后续改状态控制页面的显示; PaperCheckPage():文章查重页、CorePage():核心功能降重页、ActivationPage():软件激活页面。
                )
              )
            ])
        )
    );
  }
 }