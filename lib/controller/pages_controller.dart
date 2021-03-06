import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/pages_register.dart' show CorePage,PaperCheckPage,ActivationPage;
import '../service/service_register.dart' show SharedPreferencesService,DioService,ToastUtilsService,LogService;
import '../model/bindip_model.dart';

class PagesController extends GetxController
{

  static const CORE_PAGE_INDEX = 0;           /// 核心功能降重页
  static const PAPER_CHECK_PAGE_INDEX = 1;    /// 论文查重广告页
  static const ACTIVATION_PAGE_INDEX = 2;     /// 软件激活页

  int currentPageIndex = CORE_PAGE_INDEX;   ///当前页面索引，默认为激活页面

  bool isActivate = false;

  String activationCodeKey = "ActivationCode";

  Bindip_model bindInfo;

  static List<Object> pagesList = [ /// 注册右侧页面
    CorePage(),         // 核心降重页面
    PaperCheckPage(),   // 文章查重页
    ActivationPage(),   // 激活页面
  ];

  @override
  void onInit() {
    super.onInit();
    queryActivationStatus();
  }

  /// 改变页面
  void changePage(int index){
    currentPageIndex = index;
    update();
  }

  /// 删除激活码
  Future<void> removeActivationCode() async {
    await Get.find<SharedPreferencesService>().remove(activationCodeKey).then((value){
      if(value){
        isActivate = false;
        currentPageIndex = ACTIVATION_PAGE_INDEX;
        update();

      }else{
        Get.find<LogService>().operation("退出激活登录",operationObjectName: "PagesController 49 line");
      }

    });
  }

  /// 获取当前页面组件
  Widget getCurrentPage(){
    return pagesList[currentPageIndex];
  }

  /// 设置激活码
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

  /// 获取激活码
  String getActivationCode(){
    String activationCode = Get.find<SharedPreferencesService>().getString(activationCodeKey);
    return (activationCode != null)? activationCode: null;
  }

  /// 验证激活码
  Future<Bindip_model> verifyActivationCode(String activate) async {

    Bindip_model tmpBindipInfo;
    await DioService().get("https://www.zaojiangchong.com/api/rewrite/bindip/" + activate).then((value){
      // var data = json.decode();
      Bindip_model bindipModel = Bindip_model.fromJson(value);

      if(bindipModel.code == 200){
        tmpBindipInfo = bindipModel;
      }
    });
    if(tmpBindipInfo == null || tmpBindipInfo.code != 200) return null;
    return tmpBindipInfo;
  }

  /// 查询激活状态
  Future<bool> queryActivationStatus() async {
    String activationCode = getActivationCode();
    isActivate = (activationCode != null);
    if(isActivate){
      await verifyActivationCode(activationCode).then((value){
        if(value != null){
          bindInfo = value;
          isActivate = true;
          currentPageIndex = CORE_PAGE_INDEX;
          Get.find<SharedPreferencesService>().setString(activationCodeKey, activationCode);
        }else{
          Get.find<LogService>().info("软件未激活");
          currentPageIndex = ACTIVATION_PAGE_INDEX;
        }
      });
    } else{
      Get.find<LogService>().info("软件未激活");
      currentPageIndex = ACTIVATION_PAGE_INDEX;
    }
    update();
    return isActivate;
  }

  /// 激活软件入口
  Future<Map<String,dynamic>> activationApplication(String activationCode) async {
    bool isSuccess = false;
    String codeMsg = "";
    await DioService().get("https://www.zaojiangchong.com/api/rewrite/bindip/" + activationCode,errorReturn: {"code":400,"codeMsg":"激活失败","data":null}).then((value){
      Bindip_model bindipModel = Bindip_model.fromJson(value);
      if(bindipModel.code == 200){
        isActivate = true;
        bindInfo = bindipModel;
        currentPageIndex = CORE_PAGE_INDEX;
        Get.find<SharedPreferencesService>().setString(activationCodeKey, activationCode);
        isSuccess = true;
        Get.find<LogService>().info("软件剩余：${bindipModel.data.surplusDay} 天");
        update();
      }else{
        codeMsg = bindipModel.codeMsg;
        Get.find<LogService>().warn(codeMsg);
      }
    });
    return {"isSuccess":isSuccess,"codeMsg":codeMsg};
  }

}