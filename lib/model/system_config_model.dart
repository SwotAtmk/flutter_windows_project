/// purchaseLink : "https://item.taobao.com/item.htm?id=635752936679"
/// forgetCARDSClose : "https://item.taobao.com/item.htm?id=635752936679"
/// checkSystemList : [{"janeName":"wanfang","name":"万方查重","url":"http://taow.wfgl.checkpass.net/","explain":"包括万方检测-硕博论文版、大学生论文版、职称论文版、通用论文版，适合定稿。"},{"janeName":"turnitn","name":"Turnitn","url":"http://taow.turnitin.checkpass.net/","explain":"分UK版和国际版，国际版适合外语检测，留学生论文检测，UK版适合绝大多数英国学校。"},{"janeName":"cqvip","name":"维普查重","url":"http://taow.cqvip.checkpass.net/","explain":"支持硕博、本科、期刊版。检测范围广，数据来源权威，检测算法严格!"},{"janeName":"cnki","name":"知网查重","url":"http://taow.tvip.checkpass.net/","explain":"支持硕博、本科、期刊版。检测范围广，数据来源权威，检测算法严格!"},{"janeName":"checkpass","name":"初稿查重","url":"http://taow.cp.checkpass.net/","explain":"系统适用于对学位论文（专科、本科、硕士、博士）、新投稿论文等进行检测。"},{"janeName":"jiangchong","name":"智能降重","url":"http://taow.zjchong.checkpass.net/","explain":"整篇降重，在线编辑，同义词双击直接替换，可以直接导出双格式。"}]

class SystemConfigModel {
  String _purchaseLink;
  String _forgetCARDSClose;
  List<CheckSystemList> _checkSystemList;

  String get purchaseLink => _purchaseLink;
  String get forgetCARDSClose => _forgetCARDSClose;
  List<CheckSystemList> get checkSystemList => _checkSystemList;

  SystemConfigModel({
      String purchaseLink, 
      String forgetCARDSClose, 
      List<CheckSystemList> checkSystemList}){
    _purchaseLink = purchaseLink;
    _forgetCARDSClose = forgetCARDSClose;
    _checkSystemList = checkSystemList;
}

  SystemConfigModel.fromJson(dynamic json) {
    _purchaseLink = json["purchaseLink"];
    _forgetCARDSClose = json["forgetCARDSClose"];
    if (json["checkSystemList"] != null) {
      _checkSystemList = [];
      json["checkSystemList"].forEach((v) {
        _checkSystemList.add(CheckSystemList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["purchaseLink"] = _purchaseLink;
    map["forgetCARDSClose"] = _forgetCARDSClose;
    if (_checkSystemList != null) {
      map["checkSystemList"] = _checkSystemList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// janeName : "wanfang"
/// name : "万方查重"
/// url : "http://taow.wfgl.checkpass.net/"
/// explain : "包括万方检测-硕博论文版、大学生论文版、职称论文版、通用论文版，适合定稿。"

class CheckSystemList {
  String _janeName;
  String _name;
  String _url;
  String _explain;

  String get janeName => _janeName;
  String get name => _name;
  String get url => _url;
  String get explain => _explain;

  CheckSystemList({
      String janeName, 
      String name, 
      String url, 
      String explain}){
    _janeName = janeName;
    _name = name;
    _url = url;
    _explain = explain;
}

  CheckSystemList.fromJson(dynamic json) {
    _janeName = json["janeName"];
    _name = json["name"];
    _url = json["url"];
    _explain = json["explain"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["janeName"] = _janeName;
    map["name"] = _name;
    map["url"] = _url;
    map["explain"] = _explain;
    return map;
  }

}