import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaojiangchong_project/controller/pages_controller.dart';
import '../../controller/controller_register.dart' show PagesController;
import '../../config/system_config.dart';

class WindowTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        InkWell(
          onTap: () async {
            if(isDebug){
              await Get.find<PagesController>().removeActivationCode();
            }
          },
          child: Container(
              margin: EdgeInsets.only(right: 18),
              child: Icon(
                Icons.account_circle,
                size: 20,
                color: Color(0xff206dda),
              ) // TODO: 可以是头像，先用Icon占位，后期替换为头像
          ),
        ),
        Text(
          "卡密：",
          style: TextStyle(
              color: Color(0xff999999), fontSize: 12),
        ),
        GetBuilder<PagesController>(builder: (controller) {
          String activationCode = controller.getActivationCode();
          if(activationCode != null){
            return Container(
              margin: EdgeInsets.only(right: 15),
              child: Text(
                 activationCode,
                style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 12),
              ),
            );
          }else{
            return InkWell(
              onTap: (){
                Get.find<PagesController>().changePage(PagesController.ACTIVATION_PAGE_INDEX);
              },
              child: Container(
                margin: EdgeInsets.only(right: 15),
                child: Text(
                  "激活软件",
                  style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: 12),
                ),
              ),
            );
          }

        },),
        GetBuilder<PagesController>(builder: (controller) {
          String activationCode = controller.getActivationCode();
          if (activationCode != null) {
            return Chip(
              avatar: Image.asset("assets/images/vip_icon.png",width: 16,height: 16,),
              label: Text(
                (controller.bindInfo != null)? "剩余"+controller.bindInfo.data.surplusDay.toString()+"天":"",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              padding: EdgeInsets.only(left: 5,right: 5),
              labelPadding: EdgeInsets.only(right: 10),
              backgroundColor: Color(0xff4296ff),
            );
          } else {
            return SizedBox(width: 10,);
          }
        },)
      ],
    );
  }
}
