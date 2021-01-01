/// 激活页
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class ActivationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController editController = TextEditingController();

    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 50,top: 70),
                height: 280,
                width: 280,
                color: Colors.green,
                ///child: , 后面设置图片
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 60,left: 0,bottom: 40),
                      child: Text("Hello，欢迎使用",style: TextStyle(color: Color(0xff4296ff),fontSize: 28,fontWeight: FontWeight.w700),),
                    ),
                    Container(
                      width: 289,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Color(0xfff6f6f6),
                        borderRadius: BorderRadius.all(Radius.circular(19))
                      ),
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: editController,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),//只允许输入字母和数字
                        ],
                        decoration: InputDecoration(
                          hintText: '请输入卡密',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(19),
                            ),
                            borderSide: BorderSide.none
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 26,
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        print("激活软件");
                      },
                      child: Container(
                        height: 38,
                        width: 289,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:  Color(0xff4296ff),
                          borderRadius: BorderRadius.all(Radius.circular(19))
                        ),
                        child: Text("激活",style: TextStyle(color: Colors.white,fontSize: 16),),
                      ),
                    ),

                   Container(
                     width: 200,
                     margin: EdgeInsets.only(top: 20),
                     child:  Row(children: [
                       InkWell(
                         onTap: (){
                           print("去购买");
                         },
                         child: Text("去购买",style: TextStyle(color: Color(0xff4296ff), decoration: TextDecoration.underline,),),
                       ),
                       Spacer(),
                       InkWell(
                         onTap: (){
                           print("忘记卡密？");
                         },
                         child: Text("忘记卡密？",style: TextStyle(color: Color(0xff4296ff), ),),
                       ),
                     ],
                     ),
                   )

                  ],
                ),
              )

            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 20),
            alignment: Alignment.center,
            child: Text("需要使用者参考系统建议酌情编辑，目前没有任何一个智能系统可以一步到位达到您满意，请理性使用"
              ,style: TextStyle(color: Color(0xffbdbdbd),fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
