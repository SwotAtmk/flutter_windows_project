import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaojiangchong_project/service/dio_service.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text("这是个测试页面"),
              FlatButton(onPressed: (){
                // Get.reset();
                try{
                  Get.find<DioService>().requestData("http://www.zaopaiban.com/v1/blogroll/list").then((value){
                    print(value);
                  });
                }catch(e){
                   print(e.toString());
                }
              }, child: Text("使用Dio服务。")),
              FlatButton(onPressed: (){
                Get.reset();
                print("服务已关闭");
              }, child: Text("关闭Dio服务")),
              FlatButton(onPressed: (){
                Get.put(DioService());
                print("Dio服务加入容器中，调用生命周期函数onReady");
              }, child: Text("添加Dio服务到Get容器")),
              FlatButton(onPressed: (){
                Get.back(result: "这是返回得到的数据：success"); // 返回并携带参数
              }, child: Text("返回上级页面"))
            ],
          ),
        ),
      ),
    );
  }
}
