import 'package:flutter/material.dart';

class LeftSideHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _logo(),
          _title(),
          Divider(color: Color(0xffc9e5fd),height: 0.5,thickness: 0.5,indent: 10,endIndent: 10,)
        ],
      ),

    );
  }

  Widget _logo(){
    return Container(
      margin: EdgeInsets.only(top: 20,bottom: 20),
      child: Center(
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(width: 1, color: Color.fromRGBO(0, 0, 0, 0)),
            color: Color.fromRGBO(39, 128, 242, 1),
          ),
          child: Center(child: Image.asset("assets/images/app_logo.png",width: 42,height: 42,),),//暂时用icon代替，后面换成images Icon(Icons.image_search_outlined,color: Colors.white,)
        ),
      ),
    );
  }

  Widget _title(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top:5, bottom: 20),
      child: Image.asset("assets/images/app_logo_text.png")
    );
  }

}
