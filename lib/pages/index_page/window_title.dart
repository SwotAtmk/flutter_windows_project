import 'package:essay_writing_tool/service/log_service.dart';
import 'package:essay_writing_tool/service/toast_utils_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:essay_writing_tool/controller/pages_controller.dart';
import '../../controller/controller_register.dart' show PagesController;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

const _menuIcon = """
<svg t="1610157103540" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2575" width="200" height="200"><path d="M905.2 144.9h-785c-31.3 0-56.7 25.6-56.7 57.3v7.7c0 31.6 25.4 36.4 56.7 36.4h785c31.3 0 56.7-4.7 56.7-36.4v-7.7c0-31.7-25.4-57.3-56.7-57.3zM800.7 459.8H120.2c-31.3 0-56.7 25.6-56.7 57.3v-13.2c0 31.6 25.4 57.3 56.7 57.3h680.5c31.3 0 56.7-25.6 56.7-57.3v13.2c0-31.6-25.4-57.3-56.7-57.3z m-104.4 315h-576c-31.3 0-56.7 25.6-56.7 57.3v7.7c0 31.6 25.4 36.4 56.7 36.4h576c31.3 0 56.7-4.7 56.7-36.4V832c0-31.6-25.4-57.2-56.7-57.2z" p-id="2576"></path></svg>
""";

const _logoutIcon = """
<svg t="1610159938918" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4517" width="200" height="200"><path d="M987.52 1003.52a30.72 30.72 0 0 1-21.76-8.32l-277.12-263.68a31.36 31.36 0 0 1 0-44.8 32 32 0 0 1 44.8 0l277.12 263.04a31.36 31.36 0 0 1 0 44.8 32.64 32.64 0 0 1-23.04 8.96z" fill="#323333" p-id="4518"></path><path d="M717.44 1010.56a31.36 31.36 0 0 1-21.76-8.96 30.72 30.72 0 0 1 0-44.16L960 680.32a32 32 0 1 1 46.08 43.52l-263.04 277.12a32.64 32.64 0 0 1-25.6 9.6zM463.36 554.88a274.56 274.56 0 1 1 273.92-273.92 274.56 274.56 0 0 1-273.92 273.92z m0-485.76a211.84 211.84 0 1 0 211.2 211.84 211.84 211.84 0 0 0-211.2-211.84z" fill="#323333" p-id="4519"></path><path d="M586.24 1017.6h-576v-70.4a455.04 455.04 0 0 1 453.76-455.04 31.36 31.36 0 1 1 0 64 392.96 392.96 0 0 0-392.32 391.04v7.04h512a32 32 0 0 1 0 64z" fill="#323333" p-id="4520"></path></svg>
""";

const _exitIcon = """
<svg t="1610160085714" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5275" width="200" height="200"><path d="M1024 510.5v-0.4c0-0.4 0-0.8-0.1-1.1v-0.3c0-0.4-0.1-0.8-0.2-1.2v-0.1c-0.9-6.1-3.7-11.9-8.4-16.6L876.7 352.2c-11.7-11.7-30.8-11.7-42.4 0-11.7 11.7-11.7 30.8 0 42.4l87.4 87.4H478c-16.5 0-30 13.5-30 30s13.5 30 30 30h443.6l-87.4 87.4c-11.7 11.7-11.7 30.8 0 42.4 11.7 11.7 30.8 11.7 42.4 0l138.6-138.6c4.7-4.7 7.5-10.5 8.4-16.6v-0.1c0.1-0.4 0.1-0.8 0.2-1.2v-0.3c0-0.4 0.1-0.8 0.1-1.1v-0.4-1.5c0.1-0.5 0.1-1 0.1-1.5z" fill="" p-id="5276"></path><path d="M738 736c-16.6 0-30 13.4-30 30v164c0 18.8-15.2 34-34 34H94c-18.8 0-34-15.2-34-34V94c0-18.8 15.2-34 34-34h580c18.8 0 34 15.2 34 34v164c0 16.6 13.4 30 30 30s30-13.4 30-30V94c0-51.9-42.1-94-94-94H94C42.1 0 0 42.1 0 94v836c0 51.9 42.1 94 94 94h580c51.9 0 94-42.1 94-94V766c0-16.6-13.4-30-30-30z" fill="" p-id="5277"></path></svg>
""";

class WindowTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        InkWell(
          onTap: () async {},
          child: Container(
              margin: EdgeInsets.only(right: 12),
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
                Get.find<LogService>().operation("跳转激活软件",operationObjectName: "WindowTitle 60 line");
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
            return Container(
                width: 110,
                height: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Color(0xff4296ff)),
              child: Chip(
                avatar: Image.asset("assets/images/vip_icon.png",width: 16,height: 16,),
                label: Text(
                  (controller.bindInfo != null)? "剩余"+controller.bindInfo.data.surplusDay.toString()+"天":"",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                padding: EdgeInsets.only(left: 5,right: 5),
                labelPadding: EdgeInsets.only(right: 10),
                backgroundColor: Color(0xff4296ff),
              ),
            );
          } else {
            return SizedBox(width: 10,);
          }
        },),
        Builder(builder: (_widgetContext){
          return InkWell(
            onTap: (){
              Get.find<ToastUtilsService>().showMenuBox(_widgetContext,
                  child: GetBuilder<PagesController>(builder: (controller) {
                    Widget _activateWidget = FlatButton.icon(
                      padding: const EdgeInsets.all(10),
                      onPressed: () async {
                        Get.find<LogService>().operation("退出激活登录",operationObjectName: "WindowTitle 108 line");
                        await Get.find<PagesController>().removeActivationCode();
                        Get.find<ToastUtilsService>().removeAll(BotToast.attachedKey);
                      },
                      label: ConstrainedBox(
                        constraints: const BoxConstraints(
                            minWidth: 70),
                        child: const Text('退出登录'),
                      ),
                      icon: SvgPicture.string(_exitIcon, width: 16,height: 16,),
                    );
                    Widget _cloneWidget = FlatButton.icon(
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        Get.find<ToastUtilsService>().removeAll(BotToast.attachedKey);
                        appWindow.close();
                      },
                      label: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 70),
                        child: const Text('退出'),
                      ),
                      icon: SvgPicture.string(_exitIcon, width: 16,height: 16,),
                    );
                    List<Widget> _children = [_activateWidget];
                    // if(controller.isActivate){
                    //   _children = [_activateWidget,_cloneWidget];
                    // }

                    return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: _children
                    );
                  },)
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10 ),
              child: SvgPicture.string(_menuIcon, color: Color.fromRGBO(39, 128, 242, 1),width: 20,height: 20,),
            ),
          );
        })
      ],
    );
  }
}
