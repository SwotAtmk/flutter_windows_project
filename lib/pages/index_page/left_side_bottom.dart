import 'package:flutter/material.dart';
import '../../service/service_register.dart' show LaunchUrlService,ToastUtilsService,LogService;
import 'package:get/get.dart';
import '../../service/system_config_service.dart';
// ignore: implementation_imports
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

// ignore: must_be_immutable
class LeftSideBottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var checkSystemInfoList = Get.find<SystemConfigService>().checkSystemInfoList;
    return Column(
      children: [
        Divider(color: Color(0xffc9e5fd),height: 0.5, thickness: 1, indent: 10, endIndent: 10,),
        Container(
          width: 154,
          height: 70,
          margin: EdgeInsets.only(top: 15,bottom: 2),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: checkSystemInfoList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 18,
              childAspectRatio: 10 / 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return
                MouseStateBuilder(builder: (BuildContext context, MouseState mouseState) {
                  bool isOverOrDown = false;
                  if(mouseState.isMouseOver|| mouseState.isMouseDown) isOverOrDown = true;
                  return InkWell(
                    onTap: () {
                      Get.find<LogService>().operation("跳转外链网页店铺");
                      Get.find<ToastUtilsService>().showPromptBox(Text("该广告链接与本软件及淘宝店无关，该功能需要另外付费！", style: TextStyle(fontSize: 12,color: Colors.black),), confirm: (){
                        LaunchUrlService.launchURL(checkSystemInfoList[index]["url"]);
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4))),
                          child: Image.asset(checkSystemInfoList[index]["miniLogo"],width: 16,height: 16,),
                        ),
                        Expanded(child:Container(
                          alignment: Alignment.center,
                          child: Text(
                            checkSystemInfoList[index]["name"],
                            style: TextStyle(color: isOverOrDown?Colors.white:Color(0xffc1dcf6), fontSize: 12),
                          ),
                        )
                        )
                      ],
                    ),
                  );
                },
                );
            },
          ),
        )
      ],
    );
  }
}
