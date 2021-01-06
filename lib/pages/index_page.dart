import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'pages_register.dart' show LeftSide,RightSide;
import 'package:get/get.dart';
import '../service/update_application_service.dart';
import '../controller/controller_register.dart' show PagesController;

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

