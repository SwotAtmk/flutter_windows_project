/// 激活页
import "package:flutter/material.dart";

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
                height: 200,
                width: 200,
                color: Colors.green,
                ///child: , 后面设置图片
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60,bottom: 40),
                    child: Text("Hello，欢迎使用",style: TextStyle(color: Color(0xff4296ff),fontSize: 28,fontWeight: FontWeight.w700),),
                  ),
                  Container(
                    width: 289,
                    height: 38,
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      controller: editController,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: '请输入卡密',
                        fillColor: Color(0xff4296ff),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(19),
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                          top: 0,
                          bottom: 0,
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
                   child:  Row(children: [
                     GestureDetector(
                       onTap: (){
                         print("去购买");
                       },
                       child: Text("去购买",style: TextStyle(color: Color(0xff4296ff), decoration: TextDecoration.underline,),),
                     ),
                     Spacer(),
                     GestureDetector(
                       onTap: (){
                         print("忘记卡密？");
                       },
                       child: Text("忘记卡密？",style: TextStyle(color: Color(0xff4296ff), ),),
                     ),
                   ],
                   ),
                 )

                ],
              )

            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 20),
            alignment: Alignment.center,
            child: Text("需要使用者参考系统建议酌情编辑，目前没有任何一个智能系统可以一步到位达到您满意，请理性使用"
              ,style: TextStyle(color: Color(0xffbdbdbd),fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
