/// code : 200
/// codeMsg : "success"
/// data : {"expired_time":1611650747,"surplus_day":23}

class Bindip_model {
  int _code;
  String _codeMsg;
  Data _data;

  int get code => _code;
  String get codeMsg => _codeMsg;
  Data get data => _data;

  Bindip_model({
      int code, 
      String codeMsg, 
      Data data}){
    _code = code;
    _codeMsg = codeMsg;
    _data = data;
}

  Bindip_model.fromJson(dynamic json) {
    _code = json["code"];
    _codeMsg = json["codeMsg"];
    _data = (json["data"] != null) ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["codeMsg"] = _codeMsg;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

/// expired_time : 1611650747
/// surplus_day : 23

class Data {
  int _expiredTime;
  int _surplusDay;

  int get expiredTime => _expiredTime;
  int get surplusDay => _surplusDay;

  Data({
      int expiredTime, 
      int surplusDay}){
    _expiredTime = expiredTime;
    _surplusDay = surplusDay;
}

  Data.fromJson(dynamic json) {
    _expiredTime = (json["expired_time"] != null)?json["expired_time"]:null;
    _surplusDay = (json["surplus_day"] != null)?json["surplus_day"]:null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["expired_time"] = _expiredTime;
    map["surplus_day"] = _surplusDay;
    return map;
  }

}