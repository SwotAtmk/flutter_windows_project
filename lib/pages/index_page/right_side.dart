import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:get/get.dart';
import '../pages_register.dart' show WindowButtons,WindowTitle;
import '../../controller/controller_register.dart' show PagesController;

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
                      color: Color(0xfff6f9f9)
                  ),
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