import 'package:flutter/material.dart';
import 'package:win32/win32.dart';
import 'package:ffi/ffi.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';


class TesetMessage extends StatefulWidget {
  @override
  _TesetMessageState createState() => _TesetMessageState();
}

class _TesetMessageState extends State<TesetMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          showPopupWindow(
            context,
            childSize:Size(240, 800),
            gravity: KumiPopupGravity.center,
            curve: Curves.elasticOut,
            bgColor: Colors.grey.withOpacity(0.5),
            clickOutDismiss: true,
            clickBackDismiss: true,
            customAnimation: false,
            customPop: false,
            customPage: false,
            // targetRenderBox: (btnKey.currentContext.findRenderObject() as RenderBox),
            //needSafeDisplay: true,
            underStatusBar: false,
            underAppBar: false,
            //offsetX: -180,
            //offsetY: 50,
            duration: Duration(milliseconds: 300),
            onShowStart: (pop) {
              print("showStart");
            },
            onShowFinish: (pop) {
              print("showFinish");
            },
            onDismissStart: (pop) {
              print("dismissStart");
            },
            onDismissFinish: (pop) {
              print("dismissFinish");
            },
            onClickOut: (pop) {
              print("onClickOut");
            },
            onClickBack: (pop) {
              print("onClickBack");
            },
            childFun: (pop) {
              return StatefulBuilder(
                  key: GlobalKey(),
                  builder: (popContext, popState) {
                    return GestureDetector(
                      onTap: () {
                        //isSelect.value = !isSelect.value;
                        // popState(() {
                        //   aaa = "sasdasd";
                        // });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 180,
                        width: 130,
                        color: Colors.redAccent,
                        alignment: Alignment.center,
                        child: Text("sasdasd"),
                      ),
                    );
                  });
            },
          );
          ///win32 api弹窗
          // final message =
          // TEXT('This is not really an error, but we are pretending for the sake '
          //     'of this test.\n\nResource error.\nDo you want to try again?');
          // final title = TEXT('Dart MessageBox Test');
          //
          // final result = MessageBox(
          //     NULL,
          //     message,
          //     title,
          //     MB_ICONWARNING | // Warning
          //     MB_CANCELTRYCONTINUE | // Action button
          //     MB_DEFBUTTON2 // Second button is the default
          // );
          //
          // free(message);
          // free(title);
          //
          // switch (result) {
          //   case IDCANCEL:
          //     print('Cancel pressed');
          //     break;
          //   case IDTRYAGAIN:
          //     print('Try Again pressed');
          //     break;
          //   case IDCONTINUE:
          //     print('Continue pressed');
          //     break;
          // }
        },
        child: Text("测试弹窗"),
      ),
    );
  }
}
