import 'package:flutter/material.dart';
// ignore: must_be_immutable
class LeftSideList extends StatelessWidget {
  int currentIndex = 0;

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
class IndividualComponents extends StatefulWidget {
  Icon icon;
  String title;
  int index;

  IndividualComponents(this.icon,this.title,this.index);

  @override
  _IndividualComponentsState createState() => _IndividualComponentsState();
}

class _IndividualComponentsState extends State<IndividualComponents> {
  int currentIndex = 0;
  Color backColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          currentIndex = widget.index;
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: (widget.index == currentIndex)?Color(0xff206dda):Color(0xff153872),
            borderRadius: BorderRadius.all(Radius.circular(4))
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon,
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(widget.title,style: TextStyle(color: Colors.white),),
            )
          ],
        )
      ),
    );
  }
}
