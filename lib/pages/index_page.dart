import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'pages_register.dart' show LeftSide,RightSide;
import 'package:get/get.dart';
import '../service/update_application_service.dart';
import '../controller/controller_register.dart' show PagesController;

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.find<UpdateApplicationService>().checkUpdate(context);
    });/// 需要等待页面构建好后执行，必须放在initState中执行，不然会重复执行其中的代码，所以改用有状态组件StatefulWidget。
  }

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

