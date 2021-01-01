import 'package:get/get.dart';
import '../controller/jiangchong_controller.dart';
import '../controller/pages_controller.dart';
class JiangchongBinding extends Bindings{
  @override
  void dependencies() {
    /// 依赖绑定控制器
    Get.lazyPut<JiangchonController>(() => JiangchonController());
    Get.lazyPut<PagesController>(() => PagesController());
  }

}