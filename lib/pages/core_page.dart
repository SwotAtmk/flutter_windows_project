/// 主要降重功能页
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zaojiangchong_project/controller/controller_register.dart' show JiangchonController,PagesController;
import 'package:get/get.dart';
import 'package:zaojiangchong_project/service/service_register.dart';

// ignore: must_be_immutable
class CorePage extends StatelessWidget {
  TextEditingController editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 240,
                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 1,color: Color(0xff4296ff),)
                ),
                child: TextField(
                  controller: editController,
                  maxLines: 8,
                  onChanged: (r){
                    Get.find<JiangchonController>().changeTextNumber(r.length);
                  },
                  autofocus: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(600)
                  ],
                  keyboardType: TextInputType.text,
                  showCursor:true,
                  cursorColor: Color(0xff4296ff),
                  decoration: InputDecoration(
                      hintText: "输入需要降重的文字，单句不能少于5个字符，最多可输入600个字符",
                      hintStyle: TextStyle(color:Color(0xffbdbdbd),fontSize: 14),
                      border: OutlineInputBorder(borderSide: BorderSide.none,), /// borderSide: BorderSide(width: 0.1,color: Color(0xff4296ff))
                      contentPadding: EdgeInsets.all(28)
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: 47,
                  width: 770,
                  margin: EdgeInsets.only(left:2,right: 2),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(width: 1,color:Color(0xfff6f6f6))),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Obx(() => Text(Get.find<JiangchonController>().inputTextNumber.toString(),style: TextStyle(fontSize: 14,color: Color(0xff81b4ff)),)),
                      Text("/600字",style: TextStyle(fontSize: 14,color: Color(0xffbdbdbd)),),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          Get.find<JiangchonController>().changeTextNumber(0);
                          editController.clear();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10,right: 5),
                          width: 68,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color:Color(0xffe3e3e3)),
                            borderRadius: BorderRadius.circular(34)
                          ),
                          child: Text("清空",style: TextStyle(color:Color(0xff666666)),),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          var closeFunc = Get.find<ToastUtilsService>().showLoading();
                          Future.delayed(Duration(seconds: 5),(){
                            if(closeFunc != null){
                              closeFunc();
                              Get.find<ToastUtilsService>().showText("服务器繁忙……");
                            }
                          });
                          Get.find<JiangchonController>().getJiangchongResult(editController.text,Get.find<PagesController>().getActivationCode()).then((value){
                           Get.find<JiangchonController>().changeResultTextNumber(value.length);
                           closeFunc();
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 18),
                          width: 88,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xff4296ff),
                              borderRadius: BorderRadius.circular(34)
                          ),
                          child: Text("一键去重",style: TextStyle(color:Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
                left: 0,
                bottom: 0,
              )
            ],
          ),
          Stack(
            children: [
              Container(
                width: 770,
                height: 265,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1,color: Color(0xffe6e6e6),)
                ),
                padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 47),
                margin: EdgeInsets.only(top: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GetBuilder<JiangchonController>(builder: ( controller) {
                    return Text((controller.resultStr != null)?controller.resultStr:"",);
                  },),
                ),
              ),
              Positioned(
                child: Container(
                  height: 47,
                  width: 770,
                  margin: EdgeInsets.only(left:2,right: 2),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(width: 1,color:Color(0xfff6f6f6))),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text("降重之后字数统计  ",style: TextStyle(fontSize: 14,color: Color(0xffc3c3c3)),),
                      Obx(() => Text(Get.find<JiangchonController>().resultTextNumber.toString(),style: TextStyle(fontSize: 14,color: Color(0xff81b4ff)),)),
                      Text("  字",style: TextStyle(fontSize: 14,color: Color(0xffc3c3c3)),),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          Clipboard.setData(ClipboardData(text: Get.find<JiangchonController>().resultStr));
                          Get.find<ToastUtilsService>().showText("复制成功");
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 18),
                          width: 88,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff4296ff),
                              borderRadius: BorderRadius.circular(34)
                          ),
                          child: Text("复制",style: TextStyle(color:Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
                left: 0,
                bottom: 0,
              )
            ],
          )
        ],
      ),
    );
  }
}
