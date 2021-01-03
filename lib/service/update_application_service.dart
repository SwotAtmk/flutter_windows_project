import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:win32/win32.dart';
import 'package:get/get.dart';
import 'package:flutter_update_dialog/flutter_update_dialog.dart';
import '../service/service_register.dart' show DioService, ToastUtilsService;

/// 软件更新服务
class UpdateApplicationService {
  UpdateDialog dialog;
  PackageInfo packageInfo;

  Future<UpdateApplicationService> init() async {
    /// 初始化操作
    packageInfo = await PackageInfo.fromPlatform();
    return this;
  }

  /// 检测更新
  void checkUpdate(BuildContext context) {
    ///todo:接口获取软件版本信息
    Map<String, String> info = {
      "version": "1.0.1",
      "title": "是否升级到4.1.4版本？",
      "updateContent": "新版本大小:2.0M\n1.xxxxxxx\n2.xxxxxxx\n3.xxxxxxx",
      "downloadUrl":
          "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B0A576E00-3665-36D9-E00F-A3A0DAAC905A%7D%26lang%3Dzh-CN%26browser%3D5%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe"
    };

    if (comparisonVersion(packageInfo.version, info["version"])) {
      /// 有新版本更新
      showUpdateWidget(info, context);
    }

  }

  /// 执行更新
  void executeUpdate(String url, String saveDir, String saveFileName) {
    DioService().downloadFile(url, saveDir + saveFileName).then((value) {
      ShellExecute(
          0, TEXT("open"), TEXT(saveFileName), nullptr, TEXT(saveDir), SW_SHOW);
    });
  }

  /// 显示更新视图
  UpdateDialog showUpdateWidget(
      Map<String, String> info, BuildContext context) {
    dialog = UpdateDialog.showUpdate(context,
        width: 250,
        title: (info["title"] != null) ? info['title'] : "有新版本更新！！！",
        updateContent: (info["updateContent"] != null)
            ? info["updateContent"]
            : "更新内容：\n1、提升用户体验",
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
          Get.find<ToastUtilsService>().showText("已忽略此次更新");
          dialog.dismiss();
        },
        onUpdate: () {
          Get.find<ToastUtilsService>().showText("正在下载更新……");
          executeUpdate(info["downloadUrl"], "./update/", "update_file_" + new DateTime.now().millisecondsSinceEpoch.toString() + ".exe");
          dialog.dismiss();
        });
    return dialog;
  }

  /// 对比App版本号是否需要更新
  bool comparisonVersion(String oldVersion, String newVersion) {
    oldVersion = oldVersion.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
    List<String> oldList = oldVersion.split(".");
    newVersion = newVersion.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
    List<String> newList = newVersion.split(".");

    String transitionOldVersion="", transitionNewVersion="";
    for(int i = 0; i<oldList.length; i++){
      if(oldList[i].length > 1 && newList[i].length <= 1){
        newList[i] = "0" * (oldList[i].length - newList[i].length) + newList[i];
      }
      if(oldList[i].length <= 1 && newList[i].length >1){
        oldList[i] = "0" * (newList[i].length - oldList[i].length) + oldList[i];
      }
      transitionOldVersion +=  oldList[i];
      transitionNewVersion += newList[i];
    }

    int oldVersionNumber = int.parse(transitionOldVersion);
    int newVersionNumber = int.parse(transitionNewVersion);

    if (oldVersionNumber < newVersionNumber) return true;

    return false;
  }

}
