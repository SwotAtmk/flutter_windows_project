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
            IndividualComponents(Image.asset("assets/images/smart_yun.png"), "智能去重", 0),
            IndividualComponents(Image.asset("assets/images/search.png",height: 20,), "文章查重", 1),///Icon(Icons.search_sharp,color: Colors.white,size: 18,)
          ],
        ),
    );
  }
}

// ignore: must_be_immutable
class IndividualComponents extends StatelessWidget {
  Image image;
  String title;
  int index;

  IndividualComponents(this.image,this.title,this.index);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PagesController>(builder: (controller) {
      return InkWell(
          onTap: controller.isActivate? (){controller.changePage(index); } : null,
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
                    image,
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
    },
    );
  }
}
