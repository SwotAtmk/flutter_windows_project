import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import '../controller/jiangchong_controller.dart';
import '../service/launch_url_service.dart';


// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  TextEditingController editController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _jiangchongInput(),flex: 8,),
                Expanded(child: InkWell(onTap: (){
                  print("开始降重");
                },child: Text("开始降重"),),flex: 2,)

              ],
            ),

            Obx(()=>_jiangchongResultWidget()),

            InkWell(
              onTap: (){
                print("跳转早降重官网。");
                LaunchUrlService.launchURL("https://www.zaojiangchong.com/");
              },
              child: Text("跳转早降重官网"),
            ),
            InkWell(onTap: () async {
              var returnData = await Get.toNamed("/testPage");
              print(returnData);
            },
              child: Text("跳转页面"),
            ),
            InkWell(
              onTap: (){
                Get.toNamed("/toNameRouteTest",arguments: "这是路由传递的参数，可以为Map、List或者是一个实例");
              },
              child: Text("别名路由带参传递"),
            ),
            InkWell(
              onTap: (){
                Get.toNamed("/webviewTest");
              },
              child: Text("webview测试页"),
            ),InkWell(
              onTap: (){
                // SystemChannels.platform.invokeMethod('');
                // exit(0);
                SystemNavigator.pop();
              },
              child: Text("退出软件"),
            )
          ],
        ),
      ),
    );
  }

  Widget _jiangchongInput() {
    return Obx(()=> Container(
      child: TextField(
        controller: editController,
        maxLines: 6,
        onChanged: (r){
          Get.find<JiangchonController>().getJiangchongResult(r);
        },
        // maxLength: 100,
        // keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "输入待降重的字符",
            border: OutlineInputBorder(),
            icon: Icon(Icons.account_tree_outlined),
            errorText: (Get.find<JiangchonController>().errorResult().code == 200)? Get.find<JiangchonController>().errorResult().codeMsg: null
        ),
      ),
    ));

  }

  Widget _jiangchongResultWidget() {
    if (Get.find<JiangchonController>().jiangchongResult().data == null) {
      return Text(
        "没有任何数据！！！",
        style: TextStyle(color: Colors.red),
      );
    } else {
      return _jiangchongCardWidget(Get.find<JiangchonController>().jiangchongResult().data.sentence,Get.find<JiangchonController>().jiangchongResult().data.targetSentence);
    }
  }


  Widget _jiangchongCardWidget(sentence,targetSentence){

    return Card(
      color: Color(0xffB3FE65),
      margin: EdgeInsets.all(10),
      child: Row(children: [
        Icon(Icons.trending_flat),
        Text("降重后：${targetSentence}",maxLines: 6,)
      ],),
    );

  }

}
