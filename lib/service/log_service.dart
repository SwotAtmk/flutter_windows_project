import 'dart:io';
import 'dart:async';

extension StringExtension on DateTime{

  /// 是否是电话号码
  // bool get isMobileNumber {
  //   if(this?.isNotEmpty != true) return false;
  //   return RegExp(r'^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0,1,3,5,6,7,8])|(19)[0-9])\d{8}$').hasMatch(this);
  // }
  // String get
}

class LogService{

  static const OPERATION_LOG = "operation.log";  /// 操作日志

  static const ERROR_LOG = "error.log";          /// 错误

  static const WARN_LOG = "warn.log";            /// 警告

  String _logDirectory = "";

  // Future init() async{
  //   _logDir = new DateTime.now().toString();
  // }

  writeIn(String logText){

  }
}