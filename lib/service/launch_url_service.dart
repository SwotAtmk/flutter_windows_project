import 'package:url_launcher/url_launcher.dart';

///Url发射服务
class LaunchUrlService {
  static launchURL(url) async{
    if(await canLaunch(url)){ // 验证url是否可发射
      await launch(url); // 发射url
    }else{
      throw "url不能访问";
    }
  }

}
