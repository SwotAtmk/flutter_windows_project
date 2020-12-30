import 'package:get/get.dart';

class PagesController extends GetxController
{
  int currentPageIndex = 0; ///当前页面索引

  void changePage(int index){
    currentPageIndex = index;
    update();
  }

}