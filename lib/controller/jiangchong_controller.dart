import "package:get/get.dart" hide Response;
import 'package:zaojiangchong_project/service/dio_service.dart';
import '../model/jiangchong_result.dart';

class JiangchonController extends GetxController{
  final jiangchongResult = JiangchongResult().obs;
  final errorResult = JiangchongResult().obs;

  final inputTextNumber = 0.obs;

  changeTextNumber(int number){
    inputTextNumber(number);
  }

  Future<String> getJiangchongResult(String sentence, String _token) async {
    String targetSentence;
    try {
      await Get.find<DioService>().post("https://www.zaojiangchong.com/api/rewrite/result",param: {"code":_token,"sentence": sentence},contentType: "application/json").then((data){
        JiangchongResult result = JiangchongResult.fromJson(data);
        if (result.code == 200) {
          jiangchongResult(result);
          targetSentence = result.data.targetSentence;
        } else {
          errorResult(result);
        }
      });
    } catch (e) {
      print('ERROR:>>>>>>>>>>>>>>>${e}');
    }
    return targetSentence;
  }

}
