import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/pages_register.dart' show CorePage,PaperCheckPage,ActivationPage;
import '../service/service_register.dart' show SharedPreferencesService;

class PagesController extends GetxController
{

  static const CORE_PAGE_INDEX = 0;
  static const PAPER_CHECK_PAGE_INDEX = 1;
  static const ACTIVATION_PAGE_INDEX = 2;

  static List<Object> pagesList = [ /// 注册右侧页面
    CorePage(),         // 核心降重页面
    PaperCheckPage(),   // 文章查重页
    ActivationPage(),   // 激活页面
  ];

  int currentPageIndex = ACTIVATION_PAGE_INDEX;   ///当前页面索引，默认为激活页面

  bool isActivate = false;

  String activationCodeKey = "ActivationCode";

  void changePage(int index){
    currentPageIndex = index;
    update();
  }

  Future<void> removeActivationCode() async {
    await Get.find<SharedPreferencesService>().remove(activationCodeKey).then((value){
      if(value){
        isActivate = false;
        currentPageIndex = ACTIVATION_PAGE_INDEX;
        update();

      }else{

        print("删除验证码失败!!!");
      }

    });
  }

  Widget getCurrentPage(){
    return pagesList[currentPageIndex];
  }

  bool setActivationCode(String activate) {
    try {

      Get.find<SharedPreferencesService>().setString(activationCodeKey, activate);

      isActivate = true;

      currentPageIndex = CORE_PAGE_INDEX;

      update();

      return true;

    } catch (e) {

      return false;

    }

  }

  String getActivationCode(){
    String activationCode = Get.find<SharedPreferencesService>().getString(activationCodeKey);
    return activationCode != null?activationCode:null;
  }

  Future<bool> verifyActivationCode(activate) async {
    /// todo: 验证激活码是否有效
    return null;
  }

  bool queryActivationStatus() {
    String activationCode = Get.find<SharedPreferencesService>().getString(activationCodeKey);
    /// todo: 请求接口查询并验证激活码是否有效，及返回激活信息：剩余天数等参数。
    isActivate = (activationCode != null);
    if(isActivate) currentPageIndex = CORE_PAGE_INDEX;
    else currentPageIndex = ACTIVATION_PAGE_INDEX;
    update();
    return isActivate;
  }

}