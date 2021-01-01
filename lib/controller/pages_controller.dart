import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/paper_check_page.dart';
import '../pages/activation_page.dart';
import '../pages/core_page.dart';

class PagesController extends GetxController
{
  int currentPageIndex = 0;   ///当前页面索引

  static List<Object> pagesList = [
    CorePage(),         // 核心降重页面
    PaperCheckPage(),   // 文章查重页
    ActivationPage(),   // 激活页面
  ];

  void changePage(int index){
    currentPageIndex = index;
    update();
  }

  Widget getCurrentPage(){
    return pagesList[currentPageIndex];
  }

}