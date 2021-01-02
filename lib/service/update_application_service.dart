import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:win32/win32.dart';
import 'package:get/get.dart';
import 'package:flutter_update_dialog/flutter_update_dialog.dart';
import '../service/service_register.dart' show DioService,ToastUtilsService;

class UpdateApplicationService{
  UpdateDialog dialog;
  PackageInfo packageInfo;

  Future<UpdateApplicationService> init() async { /// 初始化操作
    packageInfo = await PackageInfo.fromPlatform();
    return this;
  }

  /// 检测更新
  void checkUpdate(BuildContext context){
    ///todo:接口获取软件版本信息
    Map<String,String> info = {"version":"1.0.2","title":"是否升级到4.1.4版本？","updateContent":"新版本大小:2.0M\n1.xxxxxxx\n2.xxxxxxx\n3.xxxxxxx","downloadUrl":"https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B0A576E00-3665-36D9-E00F-A3A0DAAC905A%7D%26lang%3Dzh-CN%26browser%3D5%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe"};
    String version = packageInfo.version;
    if(comparisonVersion(version, info["version"])) {
      print("新版本更新");
      showUpdateWidget(info,context);
    }else{
      print("无新版本更新");
    }


  }

  /// 执行更新
  void executeUpdate(String url,String saveDir,String saveFileName){
    DioService().downloadFile(url, saveDir + saveFileName)
        .then((value){
      ShellExecute(0,TEXT("open"),TEXT(saveFileName),nullptr,TEXT(saveDir),SW_SHOW);
    });
  }

  /// 显示更新视图
  UpdateDialog showUpdateWidget(Map<String,String> info,BuildContext context){
    dialog = UpdateDialog.showUpdate(context,
        width: 250,
        title: (info["title"] != null)?info['title']:"有新版本更新！！！",
        updateContent: (info["updateContent"] != null)? info["updateContent"]:"更新内容：\n1、提升用户体验",
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
        enableIgnore: true,
        onIgnore: () {
          Get.find<ToastUtilsService>().showText("忽略");
          dialog.dismiss();
        },
        onUpdate: (){
          print("去更新 -->  执行更新操作!");
          executeUpdate(info["downloadUrl"],"./update/","update_file_"+new DateTime.now().millisecondsSinceEpoch.toString()+ ".exe");
          dialog.dismiss();
        });
    return dialog;
  }

  /// 对比App版本号是否需要更新
  bool comparisonVersion(String oldVersion,String newVersion){

    oldVersion = oldVersion.replaceAll(new RegExp(r"\s+\b|\b\s"),"");
    oldVersion = oldVersion.replaceAll(".","");
    int oldVersionNumber = int.parse(oldVersion);

    newVersion = newVersion.replaceAll(new RegExp(r"\s+\b|\b\s"),"");
    newVersion = newVersion.replaceAll(".","");
    int newVersionNumber = int.parse(newVersion);

    if(oldVersionNumber < newVersionNumber) return true;

    return false;
  }

}