import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:zaojiangchong_project/routes/main_route.dart';
import 'package:get/get.dart';
import 'service/service_register.dart';
import 'package:bot_toast/bot_toast.dart';

Future main() async {
  await initServices();
  runApp(MyApp());
  /// 初始化设置windows窗体
  doWhenWindowReady(() { // 必须在runApp后调用不然会出现透明屏的情况，内部异步通过管道与C++通信设置窗体
    var win = appWindow;
    var initialSize = Size(987, 598);
    win.minSize = initialSize; // 设置窗体最小大小
    win.size = initialSize; // 初始化设置窗体大小
    win.alignment = Alignment.center; // 设置窗体居中
    win.title = "轻松写作助手"; // 设置窗体title
    win.show(); // 显示windows窗体
  });
}

/// 初始化服务
Future initServices() async {
  await Get.putAsync(() => DioService().init());               /// 初始化Dio服务
  await Get.putAsync(() => ToastUtilsService().init(0.0,0.8)); /// 初始化提示框服务
  await Get.putAsync(() => SharedPreferencesService().init()); /// 数据持久化服务
  await Get.putAsync(() => UpdateApplicationService().init()); /// 软件更新服务
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: MainRoute.routeArray,
      initialRoute: "/",
      enableLog: true,
      title: "轻松写作助手",
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
