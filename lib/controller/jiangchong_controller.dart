import "package:get/get.dart" hide Response;
import 'package:essay_writing_tool/service/dio_service.dart';
import '../model/jiangchong_result.dart';

class JiangchonController extends GetxController{
  final jiangchongResult = JiangchongResult().obs;
  final errorResult = JiangchongResult().obs;

  final inputTextNumber = 0.obs;
  final resultTextNumber = 0.obs;
  String resultStr = "";

  changeTextNumber(int number){
    inputTextNumber(number);
  }

  changeResultTextNumber(int number){
    resultTextNumber(number);
  }

  Future<String> getJiangchongResult(String sentence, String _token) async {
    try {
      String targetSentence;
      await Get.find<DioService>().post("https://www.zaojiangchong.com/api/rewrite/result",param: {"code":_token,"sentence": sentence},contentType: "application/json").then((data){
        JiangchongResult result = JiangchongResult.fromJson(data);
        if (result.code == 200) {
          jiangchongResult(result);
          resultStr = targetSentence = result.data.targetSentence;
          update();
        } else {
          errorResult(result);
        }
      });
      return targetSentence;
    } catch (e) {
      print('ERROR:>>>>>>>>>>>>>>>${e}');
      return "";
    }
  }

}
