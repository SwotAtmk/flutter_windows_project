import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller_register.dart' show PagesController;
// ignore: implementation_imports
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';
// ignore: must_be_immutable
class LeftSideList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            IndividualComponents(Image.asset("assets/images/smart_yun.png"), "智能去重", PagesController.CORE_PAGE_INDEX),
            IndividualComponents(Image.asset("assets/images/search.png"), "文章查重", PagesController.PAPER_CHECK_PAGE_INDEX),///Icon(Icons.search_sharp,color: Colors.white,size: 18,)
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
      return MouseStateBuilder(builder: (BuildContext context, MouseState mouseState) {
        bool isOverOrDown = false;
        if(mouseState.isMouseOver|| mouseState.isMouseDown) isOverOrDown = true;
        return GetBuilder<PagesController>(builder: (controller) {
          return Container(
              height: 43,
              margin: EdgeInsets.only(top:10),
              decoration: BoxDecoration(
                  color: (index == controller.currentPageIndex)?Color(0xff206dda):isOverOrDown?Color(0xff164d9b):Color(0xff153872),
                  borderRadius: BorderRadius.all(Radius.circular(4))
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: image,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(title,style: TextStyle(color: Colors.white,fontSize: 14),),
                  )
                ],
              )
          );
        },

        );
      },
        onPressed: (controller.isActivate || index == PagesController.PAPER_CHECK_PAGE_INDEX)? (){controller.changePage(index); } : (){controller.changePage(PagesController.ACTIVATION_PAGE_INDEX);}
      );
    },
    );
  }
}
