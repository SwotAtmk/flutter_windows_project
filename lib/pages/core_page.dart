/// 主要降重功能页
import 'package:flutter/material.dart';
import 'package:win32/win32.dart';
import 'dart:ffi';
import '../service/service_register.dart' show DioService,ToastUtilsService;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_update_dialog/flutter_update_dialog.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CorePage extends StatelessWidget {
  UpdateDialog dialog;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          InkWell(
            onTap: (){
              DioService().downloadFile("https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B0A576E00-3665-36D9-E00F-A3A0DAAC905A%7D%26lang%3Dzh-CN%26browser%3D5%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe", "./update/ChromeSetup.exe")
                  .then((value){
                    ShellExecute(0,TEXT("open"),TEXT("ChromeSetup.exe"),nullptr,TEXT("./update/"),SW_SHOW);
                });
            },
            child: Text("下载并执行文件"),
          ),InkWell(
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();
              print(packageInfo.appName);
              print(packageInfo.packageName);
              print(packageInfo.version);
            },
            child: Text("获取应用信息"),
          ),
          InkWell(
            onTap: () async {
              dialog = UpdateDialog.showUpdate(context,
                  width: 250,
                  title: "是否升级到4.1.4版本？",
                  updateContent: "新版本大小:2.0M\n1.xxxxxxx\n2.xxxxxxx\n3.xxxxxxx",
                  titleTextSize: 14,
                  contentTextSize: 12,
                  buttonTextSize: 12,
                  topImage: Image.asset('assets/images/bg_update_top.png'),
                  extraHeight: 5,
                  radius: 8,
                  themeColor: Color(0xFFFFAC5D),
                  progressBackgroundColor: Color(0x5AFFAC5D),
                  isForce: true,
                  updateButtonText: '升级',
                  ignoreButtonText: '忽略此版本',
                  enableIgnore: true, onIgnore: () {
                    Get.find<ToastUtilsService>().showText("忽略");
                    dialog.dismiss();
                  },
                  onUpdate: (){
                    print("去更新 -->  执行更新操作!");
                    dialog.dismiss();
                  });
            },
            child: Text("更新弹出框"),
          ),
          InkWell(
            onTap: (){
              Get.find<ToastUtilsService>().showText("测试内容测试内容测试内容");
            },
            child: Text("提示框测试"),
          )
        ],
      )
    );
  }
}
