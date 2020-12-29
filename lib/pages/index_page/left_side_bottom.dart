import 'package:flutter/material.dart';
import '../../service/launch_url_service.dart';
import '../../config/system_config.dart';

// ignore: must_be_immutable
class LeftSideBottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Color(0xffc9e5fd),
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        Container(
          width: 140,
          height: 70,
          margin: EdgeInsets.fromLTRB(10, 15, 10, 2),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 10 / 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  LaunchUrlService.launchURL(checkSystemList[index]["url"]);
                },
                child: Row(
                  children: [
                    Container( /// TODO:图标占位组件
                      margin: EdgeInsets.only(right: 10),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(220, 220, 220, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                    ),
                    Center(
                      child: Text(
                        checkSystemList[index]["name"],
                        style: TextStyle(color: Color(0xffc1dcf6), fontSize: 10),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
