import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToNameRouteTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print();// 接受路由传入的值
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Text("传入的数据："+Get.arguments.toString()),
            FlatButton(onPressed: (){Get.back();}, child: Text("返回"))
          ],
        ),
      ),
    );
  }
}
