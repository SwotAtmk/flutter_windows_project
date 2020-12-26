import 'dart:ui';

import 'package:desktop_window/desktop_window.dart';
class WindowsSizeService{
  static Future initWindows() async {
    await DesktopWindow.setMinWindowSize(Size(800,400));
    await DesktopWindow.setMaxWindowSize(Size(900,600));

  }

  static Future testWindowFunctions() async {
    Size size = await DesktopWindow.getWindowSize();
    print(size);
    // await DesktopWindow.setWindowSize(Size(500,500));
    // await DesktopWindow.resetMaxWindowSize();
    // await DesktopWindow.toggleFullScreen();
    return size;
  }
}
