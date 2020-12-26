import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import '../routes/main_route.dart';
import '../service/dio_service.dart';

Future<void> main() async {
  await initServices(); /// 初始化服务
  runApp(MyApp());
}

void initServices() async {
  print('starting services ...');
  ///这里是你放get_storage、hive、shared_pref初始化的地方。
  ///或者moor连接，或者其他什么异步的东西。
  await Get.putAsync(() => DioService().init());
  print('All services started...');
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '早降重 Windows Demo',
      enableLog: true,
      initialRoute: MainRoute.INIT_PAGES,
      getPages: MainRoute.routeArray,
    );
  }

}