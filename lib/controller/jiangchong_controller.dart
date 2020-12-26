import "package:get/get.dart" hide Response;
import 'package:zaojiangchong_project/service/dio_service.dart';
import '../model/jiangchong_result.dart';

class JiangchonController extends GetxController{
  final jiangchongResult = JiangchongResult().obs;
  final errorResult = JiangchongResult().obs;

  void getJiangchongResult(String sentence) {
    try {
      Get.find<DioService>().requestData("http://api.zaojiangchong.com/rewrite/quickExperience",param: {"sentence": sentence},contentType: "application/json").then((data){
        JiangchongResult result = JiangchongResult.fromJson(data);
        if(result.code == 200){
          jiangchongResult(result);
        }else{
          errorResult(result);
        }
        update();
      });
    } catch (e) {
      print('ERROR:>>>>>>>>>>>>>>>${e}');
    }
  }

}
