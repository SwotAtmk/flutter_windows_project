import 'package:flutter/painting.dart';
import 'package:bot_toast/bot_toast.dart';

class ToastUtilsService{
  double x;
  double y;


  Future<ToastUtilsService> init (ix,iy) async{
    x = ix;
    y = iy;
    return this;
  }

  /// 显示默认Text
  dynamic showText(textContent) => BotToast.showText(text:textContent, align: Alignment(x,y));

}