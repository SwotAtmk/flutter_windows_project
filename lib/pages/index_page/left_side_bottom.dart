import 'package:flutter/material.dart';
import '../../service/launch_url_service.dart';

// ignore: must_be_immutable
class LeftSideBottom extends StatelessWidget {
  List<Map<String, String>> checkSystemList = [
    {
      "janeName": "wanfang",
      "name": "万方查重",
      "url": "http://ally.wfgl.checkpass.net/",
      "logoImage": "",
    },
    {
      "janeName": "turnitn",
      "name": "Turnitn",
      "url": "http://ally.turnitin.checkpass.net/",
      "logoImage": ""
    },
    {
      "janeName": "cqvip",
      "name": "维普查重",
      "url": "http://ally.cqvip.checkpass.net/",
      "logoImage": ""
    },
    {
      "janeName": "cnki",
      "name": "知网查重",
      "url": "http://ally.tvip.checkpass.net/",
      "logoImage": ""
    },
    {
      "janeName": "checkpass",
      "name": "初稿查重",
      "url": "http://ally.cp.checkpass.net/",
      "logoImage": ""
    },
    {
      "janeName": "jiangchong",
      "name": "智能降重",
      "url": "http://ally.zjchong.checkpass.net/",
      "logoImage": ""
    }
  ];

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
