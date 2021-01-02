import 'package:flutter/painting.dart';
import 'package:bot_toast/bot_toast.dart';

/// 提示服务
class ToastUtilsService{
  double x;
  double y;


  Future<ToastUtilsService> init (ix,iy) async{
    x = ix;
    y = iy;
    return this;
  }

  /// 显示默认Text
  CancelFunc showText(textContent) => BotToast.showText(text:textContent, align: Alignment(x,y));

  CancelFunc showLoading() => BotToast.showLoading();

}