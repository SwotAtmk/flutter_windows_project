import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'log_service.dart';
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
  Future requestData(String path,
      {Map<String,dynamic> param, String contentType = "application/x-www-form-urlencoded"}) async {
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
      Get.find<LogService>().error("reuqestUrl -> ${path}"+e.toString());
    }
  }

  Future post(String path,
      {Map<String,dynamic> param, String contentType = "application/x-www-form-urlencoded"}) async {
    try {
      dio.options.contentType = contentType;
      Response response = await dio.post(path, data: param);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("接口异常");
      }
    } catch (e) {
      Get.find<LogService>().error("reuqestUrl -> ${path}"+e.toString());
    }
  }

  Future get(String path,
      {Map<String,dynamic> param, String contentType = "application/x-www-form-urlencoded",dynamic errorReturn}) async {
    try {
      dio.options.contentType = contentType;
      Response response = await dio.get(path, queryParameters: param);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("接口异常");
      }
    } catch (e) {
      Get.find<LogService>().error("reuqestUrl -> ${path}"+e.toString());
      return errorReturn;
    }
  }

  Future<Response> downloadFile(String url,String savePath) async {
    Get.find<LogService>().error("downloadFileUrl -> ${url}");
    return await dio.download(url, savePath);
  }
}
