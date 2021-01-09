import 'package:url_launcher/url_launcher.dart';
import 'log_service.dart';
import 'package:get/get.dart';
///Url发射服务
class LaunchUrlService {
  static launchURL(url) async{
    try{
      Get.find<LogService>().info("LaunchUrl: ${url}");
      if(await canLaunch(url)){ // 验证url是否可发射
        await launch(url); // 发射url
      }else{
        Get.find<LogService>().error("Url: ${url}不能访问");
        throw "url不能访问";
      }
    }catch(e){
      Get.find<LogService>().error("Url: ${url}发送异常");
    }

  }

}
