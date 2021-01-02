import 'package:shared_preferences/shared_preferences.dart';

/// 持久化服务
class SharedPreferencesService {
  SharedPreferences prefs;

  Future<SharedPreferencesService> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  dynamic get(dynamic key) => prefs.get(key);

  String getString(dynamic key) => prefs.getString(key);

  List<String> getStringList(dynamic key) => prefs.getStringList(key);

  int getInt(dynamic key) => prefs.getInt(key);

  double getDouble(dynamic key) => prefs.getDouble(key);

  bool getBool(dynamic key) => prefs.getBool(key);

  Set<String> getKeys() => prefs.getKeys();

  SharedPreferences setString(dynamic key,String value){
    prefs.setString(key, value);
    return prefs;
  }

  SharedPreferences setStringList(dynamic key,List<String> value){
    prefs.setStringList(key, value);
    return prefs;
  }

  SharedPreferences setInt(dynamic key,int value){
    prefs.setInt(key, value);
    return prefs;
  }

  SharedPreferences setDouble(dynamic key,double value){
    prefs.setDouble(key, value);
    return prefs;
  }

  SharedPreferences setBool(dynamic key,bool value){
    prefs.setBool(key, value);
    return prefs;
  }

  Future<bool> remove(key) async{
    return await prefs.remove(key);
  }

  Future<bool> clear() async{
    return await prefs.clear();
  }




}