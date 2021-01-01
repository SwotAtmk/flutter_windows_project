import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller_register.dart' show PagesController;
// ignore: must_be_immutable
class LeftSideList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            IndividualComponents(Icon(Icons.wb_cloudy_outlined,color: Colors.white,size: 18,), "智能去重", 0),
            IndividualComponents(Icon(Icons.search_sharp,color: Colors.white,size: 18,), "文章查重", 1),
          ],
        ),
    );
  }
}

// ignore: must_be_immutable
class IndividualComponents extends StatelessWidget {
  Icon icon;
  String title;
  int index;

  IndividualComponents(this.icon,this.title,this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.find<PagesController>().changePage(index);
      },
      child: GetBuilder<PagesController>(builder: (controller) {
        return Container(
            height: 40,
            margin: EdgeInsets.only(top:10),
            decoration: BoxDecoration(
                color: (index == controller.currentPageIndex)?Color(0xff206dda):Color(0xff153872),
                borderRadius: BorderRadius.all(Radius.circular(4))
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(title,style: TextStyle(color: Colors.white,fontSize: 14),),
                )
              ],
            )
        );
      },

      )
    );
  }
}
