import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    var win = appWindow;
    var initialSize = Size(600, 450);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });
}

var borderColor = Color(0xFF805306);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: WindowBorder(
                color: borderColor,
                width: 1,
                child: Row(children: [LeftSide(), RightSide()]))));
  }
}

var sidebarColor = Color(0xFFF6A00C);

class LeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: Container(
            color: sidebarColor,
            child: Column(
              children: [
                WindowTitleBarBox(child: MoveWindow()),
                Expanded(child: Container())
              ],
            )));
  }
}

var backgroundStartColor = Color(0xFFFFD500);
var backgroundEndColor = Color(0xFFF6A00C);

class RightSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [backgroundStartColor, backgroundEndColor],
                  stops: [0.0, 1.0]),
            ),
            child: Column(children: [
              WindowTitleBarBox(
                  child: Row(children: [
                    Expanded(child: MoveWindow()),
                    WindowButtons()
                  ])),
            ])));
  }
}

var buttonColors = WindowButtonColors(
    iconNormal: Color(0xFF805306),
    mouseOver: Color(0xFFF6A00C),
    mouseDown: Color(0xFF805306),
    iconMouseOver: Color(0xFF805306),
    iconMouseDown: Color(0xFFFFD500));

var closeButtonColors = WindowButtonColors(
    mouseOver: Colors.red[700],
    mouseDown: Colors.red[900],
    iconNormal: Color(0xFF805306),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}