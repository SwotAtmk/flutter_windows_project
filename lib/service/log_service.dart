import 'dart:io';
import 'dart:async';

import 'package:essay_writing_tool/util/toolsWith.dart';

class LogService with ToolsWith{

  static const OPERATION_LOG = "operation.log";  /// 操作日志

  static const ERROR_LOG = "error.log";          /// 错误

  static const WARN_LOG = "warn.log";            /// 警告

  static const INFO_LOG = "info.log";

  String logDirectory = "";

  Future<LogService> init() async{
    DateTime nowDateTime = DateTime.now();
    folderExists(currentDirectory+ds+"log");
    logDirectory = "${currentDirectory}${ds}log"+ds+ dateToYMD(nowDateTime);
    folderExists(logDirectory);
    return this;
  }

  Future<void> writeLogIn(String logText,File file) async {
    var contents = await file.readAsString();
    file.writeAsStringSync(contents+logText);
  }

  error(String log, {String errorObjectName}) {
    String _logDirectory = logDirectory.isEmpty?"${Directory.current.path}${ds}log":logDirectory;
    folderExists(_logDirectory);
    getFile(_logDirectory,ERROR_LOG).then((errorFile){
      writeLogIn("["+new DateTime.now().toString()+"]  ERROR -> ${errorObjectName}: " + log+"\n", errorFile);
    });
  }

  warn(String log,{String warnObjectName}) {
    String _logDirectory = logDirectory.isEmpty?"${Directory.current.path}${ds}log":logDirectory;
    folderExists(_logDirectory);
    getFile(_logDirectory,WARN_LOG).then((warnFile){
      writeLogIn("["+new DateTime.now().toString()+"]  WARN -> ${warnObjectName}: " + log+"\n", warnFile);
    });
  }

  operation(String log,{String operationObjectName=""}) {
    String _logDirectory = logDirectory.isEmpty?"${Directory.current.path}${ds}log":logDirectory;
    folderExists(_logDirectory);
    getFile(_logDirectory,OPERATION_LOG).then((operationFile){
      writeLogIn("["+new DateTime.now().toString()+"]  OPERATION -> ${operationObjectName}: " + log+"\n", operationFile);
    });
  }

  info(String log){
    String _logDirectory = logDirectory.isEmpty?"${Directory.current.path}${ds}log":logDirectory;
    folderExists(_logDirectory);
    getFile(_logDirectory,INFO_LOG).then((operationFile){
      writeLogIn("["+new DateTime.now().toString()+"]  INFO: " + log+"\n", operationFile);
    });
  }

}