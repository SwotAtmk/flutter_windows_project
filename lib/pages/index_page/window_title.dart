import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller_register.dart' show PagesController;

class WindowTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        InkWell(
          onTap: () async {
            await Get.find<PagesController>().removeActivationCode();
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
          return Container(
            margin: EdgeInsets.only(right: 15),
            child: Text(
              (activationCode != null) ? activationCode : "激活软件",
              style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12),
            ),
          );
        },),
        GetBuilder<PagesController>(builder: (controller) {
          String activationCode = controller.getActivationCode();
          if (activationCode != null) {
            return Container(
                width: 105,
                height: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Color(0xff4296ff)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.verified_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          "剩余30天",

                          /// TODO:状态管理获取，非真实数据
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                )
            );
          } else {
            return SizedBox(width: 10,);
          }
        },)
      ],
    );
  }
}
