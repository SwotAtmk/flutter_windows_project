import 'package:get/get.dart';
import '../controller/controller_register.dart';
class JiangchongBinding extends Bindings{
  @override
  void dependencies() {
    /// 依赖绑定控制器
    Get.lazyPut<JiangchonController>(() => JiangchonController());    /// 降重核心功能控制器
    Get.lazyPut<PagesController>(() => PagesController());            /// 页面管理器
  }

}