import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'window_buttons.dart';
import 'window_title.dart';
import 'package:get/get.dart';
import '../../controller/pages_controller.dart';

class RightSide extends GetView<PagesController> {
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
                  ),  /// TODO:右侧页面，后续改状态控制页面的显示; PaperCheckPage():文章查重页、CorePage():核心功能降重页、ActivationPage():软件激活页面。
                  child: GetBuilder<PagesController>(
                    builder: (controller){
                      return controller.getCurrentPage();
                    },
                  )
                )
              )
            ])
        )
    );
  }
 }