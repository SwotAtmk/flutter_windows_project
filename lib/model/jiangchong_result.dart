/// code : 200
/// codeMsg : "success"
/// data : {"sentence":"今天忘记吃早餐了，导致我现在非常饥饿。","targetSentence":"今天忘记吃早餐,导致我现在很饿。"}

class JiangchongResult {
  int _code;
  String _codeMsg;
  Data _data;

  int get code => _code;
  String get codeMsg => _codeMsg;
  Data get data => _data;

  JiangchongResult({
      int code, 
      String codeMsg, 
      Data data}){
    _code = code;
    _codeMsg = codeMsg;
    _data = data;
}

  JiangchongResult.fromJson(dynamic json) {
    _code = json["code"];
    _codeMsg = json["codeMsg"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
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

/// sentence : "今天忘记吃早餐了，导致我现在非常饥饿。"
/// targetSentence : "今天忘记吃早餐,导致我现在很饿。"

class Data {
  String _sentence;
  String _targetSentence;

  String get sentence => _sentence;
  String get targetSentence => _targetSentence;

  Data({
      String sentence, 
      String targetSentence}){
    _sentence = sentence;
    _targetSentence = targetSentence;
}

  Data.fromJson(dynamic json) {
    _sentence = json["sentence"];
    _targetSentence = json["targetSentence"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sentence"] = _sentence;
    map["targetSentence"] = _targetSentence;
    return map;
  }

}