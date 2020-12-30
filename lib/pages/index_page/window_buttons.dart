import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _closeIcon = """
<svg 
    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
    <g clip-path="url(#clip0)" fill-rule="evenodd" clip-rule="evenodd">
        <path d="M19.1 19.819L.283 1 1.975-.064l18.82 18.819-1.694 1.064z"/>
        <path d="M.001 18.819L18.82 0l1.693 1.064-18.818 18.82L0 18.818z"/>
    </g>
    <defs>
        <clipPath id="clip0">
            <path d="M0 0h20v20H0z"/>
        </clipPath>
    </defs>
</svg>
""";

const _maximizeIcon = """
<svg fill="none"
    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
    <path fill-rule="evenodd" clip-rule="evenodd" d="M17.5 2.5h-15v15h15v-15zM.5.5v19h19V.5H.5z" fill="#fff"/>
</svg>
""";

const _minimizeIcon = """
<svg
    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
    <path fill-rule="evenodd" clip-rule="evenodd" d="M20 12H0v-2h20v2z"/>
</svg>
""";

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child:Center(
              child: SvgPicture.string(_minimizeIcon, color: Colors.black,width: 12,height: 12,),
            ),
          ),
          onTap: () {
            appWindow.minimize(); // 窗口最小化
          },
        ),
        GestureDetector(
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child:Center(
              child: SvgPicture.string(_maximizeIcon, color: Colors.black45,width: 12,height: 12,),
            ),
          ),
          onTap: () {
            // appWindow.maximizeOrRestore(); // todo:窗口最大化暂时关闭
          },
        ),
        GestureDetector(
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.fromLTRB(8, 0, 18, 0),
            child:Center(
              child: SvgPicture.string(_closeIcon, color: Colors.black,width: 12,height: 12,),
            ),
          ),
          onTap: () {
            appWindow.close(); // 窗口关闭
          },
        ),
      ],
    );
  }
}
