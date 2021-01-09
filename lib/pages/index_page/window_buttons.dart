import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: implementation_imports
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';
import '../../service/log_service.dart';
import 'package:get/get.dart';

const _closeIcon = """
<svg xmlns="http://www.w3.org/2000/svg" t="1610007577754" class="icon" viewBox="0 0 1024 1024" version="1.1" p-id="9970" width="200" height="200"><defs></defs><path d="M505.173333 416.426666 122.88 27.306666c-27.306667-27.306667-68.266667-27.306667-102.4 0l0 0c-27.306667 27.306667-27.306667 68.266667 0 102.4L409.6 512l-389.12 389.12c-27.306667 27.306667-27.306667 68.266667 0 102.4l0 0c27.306667 27.306667 68.266667 27.306667 102.4 0l389.12-389.12 389.12 389.12c27.306667 27.306667 68.266667 27.306667 102.4 0l0 0c27.306667-27.306667 27.306667-68.266667 0-102.4L607.573333 512l389.12-389.12c27.306667-27.306667 27.306667-68.266667 0-102.4l0 0c-27.306667-27.306667-68.266667-27.306667-102.4 0L505.173333 416.426666 505.173333 416.426666z" p-id="9971"/></svg>
""";
const _hoverCloseIcon = """
<svg xmlns="http://www.w3.org/2000/svg" t="1610010891831" class="icon" viewBox="0 0 1024 1024" version="1.1" p-id="14620" width="200" height="200"><defs></defs><path d="M940.8 207.530667L818.602667 85.333333l-305.493334 305.493334L207.616 85.333333 85.333333 207.530667l305.493334 305.493333L85.333333 818.517333l122.282667 122.282667 305.493333-305.493333 305.493334 305.493333 122.197333-122.282667-305.493333-305.493333z" p-id="14621"/></svg>
""";
///<style type="text/css"/>
const _maximizeIcon = """
<svg xmlns="http://www.w3.org/2000/svg" t="1610008205861" class="icon" viewBox="0 0 1024 1024" version="1.1" p-id="13278" width="200" height="200"><defs></defs><path d="M170.666667 170.666667 853.333333 170.666667 853.333333 853.333333 170.666667 853.333333 170.666667 170.666667M256 341.333333 256 768 768 768 768 341.333333 256 341.333333Z" p-id="13279"/></svg>
""";

const _minimizeIcon = """
<svg xmlns="http://www.w3.org/2000/svg"  t="1610007935049" class="icon" viewBox="0 0 1024 1024" version="1.1" p-id="12041" width="200" height="200"><defs></defs><path d="M923 571H130.7c-27.6 0-50-22.4-50-50s22.4-50 50-50H923c27.6 0 50 22.4 50 50s-22.4 50-50 50z" fill="" p-id="12042"/></svg>
""";

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseStateBuilder(
          builder:(context, mouseState){
            bool isOverOrDown = false;
            if(mouseState.isMouseOver|| mouseState.isMouseDown) isOverOrDown = true;
            return Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child:Center(
                child: SvgPicture.string(_minimizeIcon, color: isOverOrDown?Color.fromRGBO(39, 128, 242, 1):Colors.black,width: isOverOrDown?20:16,height: isOverOrDown?20:16,),
              ),
            );
          },
          onPressed: (){
            Get.find<LogService>().operation("最小化程序");
            appWindow.minimize(); // 窗口最小化
          },
        ),
        GestureDetector(
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child:Center(
              child: SvgPicture.string(_maximizeIcon, color: Colors.black45,width: 20,height: 20,),
            ),
          ),
          onTap: () {
            // appWindow.maximizeOrRestore(); // todo:窗口最大化暂时关闭
          },
        ),
        MouseStateBuilder(
          builder: (BuildContext context, MouseState mouseState) {
             bool isOverOrDown = false;
             if(mouseState.isMouseOver|| mouseState.isMouseDown) isOverOrDown = true;
              return Container(
                width: 20,
                height: 20,
                margin: EdgeInsets.fromLTRB(8, 0, 18, 0),
                child:Center(
                  child: isOverOrDown?SvgPicture.string(_hoverCloseIcon, color: Colors.red,width: 18,height: 18,):SvgPicture.string(_closeIcon, color: Colors.black,width: 12,height: 12, ),
                ),
              );
          },
          onPressed: (){
            Get.find<LogService>().operation("退出程序");
            appWindow.close(); // 窗口关闭
          },
        ),
      ],
    );
  }
}
