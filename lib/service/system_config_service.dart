import 'dart:convert';

import 'package:essay_writing_tool/model/system_config_model.dart';
import 'package:essay_writing_tool/util/toolsWith.dart';

const isDebug = false;
const domainJaneName = "taow";
const isHttps = false;
const reducedWordLimit = 200;  ///降重字数限制

class SystemConfigService with ToolsWith{

  ///默认系统配置
  String _purchaseLink = "https://item.taobao.com/item.htm?id=635752936679"; /// 卡密购买链接
  String _forgetCARDSClose = "https://item.taobao.com/item.htm?id=635752936679"; /// 忘记卡密链接
  List<Map<String, String>> _checkSystemInfoList = [
    {
      "janeName": "wanfang",
      "name": "万方查重",
      "url": (isHttps?"https://":"http://") + domainJaneName + ".wfgl.checkpass.net/",
      "logoImage": "assets/images/logo_wanfang.png",
      "miniLogo":"assets/images/mini_logo_wanfang.png",
      "explain": "包括万方检测-硕博论文版、大学生论文版、职称论文版、通用论文版，适合定稿。"
    },
    {
      "janeName": "turnitn",
      "name": "Turnitn",
      "url": (isHttps?"https://":"http://") + domainJaneName + ".turnitin.checkpass.net/",
      "logoImage": "assets/images/logo_turnitin.png",
      "miniLogo":"assets/images/mini_logo_turnitin.png",
      "explain": "分UK版和国际版，国际版适合外语检测，留学生论文检测，UK版适合绝大多数英国学校。"
    },
    {
      "janeName": "cqvip",
      "name": "维普查重",
      "url": (isHttps?"https://":"http://") + domainJaneName + ".cqvip.checkpass.net/",
      "logoImage": "assets/images/logo_weipu.png",
      "miniLogo":"assets/images/mini_logo_weipu.png",
      "explain": "支持硕博、本科、期刊版。检测范围广，数据来源权威，检测算法严格!"
    },
    {
      "janeName": "cnki",
      "name": "知网查重",
      "url": (isHttps?"https://":"http://") + domainJaneName + ".tvip.checkpass.net/",
      "logoImage": "assets/images/logo_zhiwang.png",
      "miniLogo":"assets/images/mini_logo_zhiwang.png",
      "explain": "支持硕博、本科、期刊版。检测范围广，数据来源权威，检测算法严格!"
    },
    {
      "janeName": "checkpass",
      "name": "初稿查重",
      "url": (isHttps?"https://":"http://") + domainJaneName + ".cp.checkpass.net/",
      "logoImage": "assets/images/logo_checkpass.png",
      "miniLogo":"assets/images/mini_logo_checkpass.png",
      "explain": "系统适用于对学位论文（专科、本科、硕士、博士）、新投稿论文等进行检测。"
    },
    {
      "janeName": "jiangchong",
      "name": "智能降重",
      "url": (isHttps?"https://":"http://") + domainJaneName + ".zjchong.checkpass.net/",
      "logoImage": "assets/images/logo_jiangchong.png",
      "miniLogo": "assets/images/mini_logo_jiangchong.png",
      "explain": "整篇降重，在线编辑，同义词双击直接替换，可以直接导出双格式。"
    }
  ];
  SystemConfigModel _systemConfigModel;

  List<Map<String,String>> get checkSystemInfoList => _checkSystemInfoList;
  set setCheckSystemInfoList(List<Map<String,String>> value) => _checkSystemInfoList = value;

  SystemConfigModel get systemConfigModel => _systemConfigModel;
  set setSystemConfigModel(SystemConfigModel value) => _systemConfigModel = value;

  String get purchaseLink => _purchaseLink;
  set setPurchaseLink(String value) => _purchaseLink = value;

  String get forgetCARDSClose => _forgetCARDSClose;
  set setForgetCARDSClose(String value) => _forgetCARDSClose = value;

  Future<SystemConfigService> init() async{
    String configDirectory = currentDirectory + ds + "config";
    folderExists(configDirectory);
    await checkFileExists(
      configDirectory+ds,
      "system_config.dat"
    ).then((configFile) async{
      if(configFile!=null){
        String configJsonStr = await configFile.readAsString();
        if(configJsonStr != null || configJsonStr !=""){
          var data = json.decode(configJsonStr);
          setSystemConfigModel = SystemConfigModel.fromJson(data);
          List<Map<String, String>> tmpCheckSystemList = checkSystemInfoList;
          for(int i=0; i < systemConfigModel.checkSystemList.length; i++){
            tmpCheckSystemList[i]["janeName"] = systemConfigModel.checkSystemList[i].janeName;
            tmpCheckSystemList[i]["name"] = systemConfigModel.checkSystemList[i].name;
            tmpCheckSystemList[i]["url"] = systemConfigModel.checkSystemList[i].url;
            tmpCheckSystemList[i]["explain"] = systemConfigModel.checkSystemList[i].explain;
          }
          setCheckSystemInfoList = tmpCheckSystemList;
          setForgetCARDSClose = systemConfigModel.forgetCARDSClose;
          setPurchaseLink = systemConfigModel.purchaseLink;
        }
      }
    });
    return this;
  }
}