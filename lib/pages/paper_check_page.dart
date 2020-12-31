import 'package:flutter/material.dart';
import '../config/system_config.dart';
import '../service/launch_url_service.dart';

/// 文章查重页
class PaperCheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  // decoration: BoxDecoration(color: Color(0xfff6f9f9)),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "文章查重",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: checkSystemList.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 40,
                      childAspectRatio: 10 / 9,
                    ),
                    itemBuilder: (context, index) {
                      return _itemWidget(checkSystemList[index]["name"],
                          explain:
                          "测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内测试内容测试内容测试内容",
                          jumpLink: checkSystemList[index]["url"]);
                    }),

              ],
            )),
        Positioned(
          child: Container(
            color: Color.fromRGBO(233, 246, 253, 1),
            alignment: Alignment.center,
            child: Text(
              "广告",
              style: TextStyle(
                  fontSize: 12, color: Color.fromRGBO(69, 141, 244, 1)),
            ),
          ),
          right: 0,
          bottom: 0,
          width: 38,
          height: 16,
        )
      ],
    );
  }

  Widget _itemWidget(String title,
      {String logoImage, String jumpLink, String explain}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(2)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            height: 48,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20, bottom: 5),
            child: Text(
              explain,
              style: TextStyle(color: Color(0xffbdbdbd), fontSize: 12),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Divider(
              indent: 2,
              endIndent: 2,
              thickness: 1,
              height: 0.5,
              color: Color(0xffbdbdbd),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    LaunchUrlService.launchURL(jumpLink);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xff4296ff)),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          "立即查重",
                          style:
                              TextStyle(color: Color(0xff4296ff), fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(Icons.web_sharp),

                  /// TODO: LOGO 需要替换，暂时不放真实LOGO
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
