import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:get/get.dart' hide Response;

class DioService extends GetxService {
  static Dio dio = new Dio();

  ///初始化Dio模块
  Future<DioService> init({isIgnoreCertificate = true}) async {
    if (isIgnoreCertificate) {
      ///忽略SSL证书错误
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback = (cert, host, port) {
          return true;
        };
      };
    }
    return this;
  }

  /// Getx服务生命周期
  void onInit() {
    super.onInit();
  }

  /// 同上
  void onReady() {
    super.onReady();
  }

  /// 同上
  void onClose() {
    super.onClose();
  }

  ///请求接口数据
  Future requestData(path,
      {param, String contentType = "application/x-www-form-urlencoded"}) async {
    try {
      print("获取数据${path}.............................");
      dio.options.contentType = contentType;
      Response response = await dio.post(path, data: param);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("接口异常");
      }
    } catch (e) {
      print('ERROR:>>>>>>>>>>>>>>>${e}');
    }
  }

  Future<Response> downloadFile(url, savePath) async {
    return await dio.download(url, savePath,
        // onReceiveProgress: (received, total) { /// 文件下载进度
        //   if (total != -1) {
        //     print((received / total * 100).toStringAsFixed(0) + "%");
        //   }
        // }
    );
  }
}
